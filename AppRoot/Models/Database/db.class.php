<?php
	session_start();

	class database
	{
		private $config = array(
			'host' => 'localhost',
			'user' => 'ezikpro_emo',
			'pass' => 'tosho_e_gei_42',
			'database'=> 'ezikpro_atanasko',
			'encoding'=> 'utf8'
		);

		public $dbHandle = null;

		function __construct($config=array())
		{
			if(!empty($config))
			{
				$this->config = $config;
			}

			$this->dbHandle = mysqli_connect($this->config['host'],$this->config['user'],$this->config['pass']);
			mysqli_select_db( $this->dbHandle, $this->config['database']);

			mysqli_query($this->dbHandle, "SET NAMES '".$this->config['encoding']."'");

		}

		function execute($query)
		{
			$result = mysqli_query($this->dbHandle,$query);
		}

		function fetchArray($query)
		{
			$result = mysqli_query($this->dbHandle,$query);
			//echo "<pre>";
			//var_dump($result);
			//exit;

			$info = array();

			if($result)
			{
				while($row = mysqli_fetch_assoc($result))
				{
					$info[] = $row;
				}
			}

			return $info;
		}


		function saveArray($table,$info)
		{
			//$table = 'products';

			if(!isset($info[0]))
			{
				$info = array(0=>$info);
			}
			foreach($info as $key=>$row)
			{
				if(isset($row['id']) && $row['id']>0)
				{
					// update
					$this->updateRow($table, $row);
				}
				else
				{
					// insert
					$id = $this->insertRow($table, $row);
					return $id;
				}
			}
		}

		function updateRow($table, $row)
		{
			$query = "UPDATE `".$table."` SET ";

			$conditions = array();
			foreach($row as $dbField=>$dbValue)
			{
				$conditions[] = " `".$table."`.`".$dbField."` = '".$dbValue."'";
			}
			$query .= implode(',', $conditions);
			$query .= " WHERE `".$table."`.`id` = '".$row['id']."'";
			mysqli_query($this->dbHandle, $query);
		}

		function insertRow($table, $row)
		{
			$query = "INSERT INTO `".$table."` (";

			$query .= "`".implode('`,`', array_keys($row))."`";

			$query .= ") VALUES (";


			$query .= "'".implode("','", $row)."'";
			$query .= ")";
			mysqli_query($this->dbHandle, $query);
			return mysqli_insert_id($this->dbHandle);
		}

		function deleteRow($table, $where, $searchBy)
		{
			$query = "DELETE FROM `".$table."` WHERE `".$searchBy."` = '".$where."'";
			mysqli_query($this->dbHandle, $query);
		}

		function getAll($table)
		{
			$query = "SELECT * FROM " . $table;
			return $this->fetchArray($query);
		}

		function getBy($table, $byName, $byValue)
		{
			$query = "SELECT * FROM " . $table . " WHERE " . $byName . " = " . $byValue;
			return $this->fetchArray($query);
		}
	}

	$db = new database();

?>
