<?php

namespace App\Entity;

use App\Entity\Mapper;

class Native extends Mapper
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getNativeConnection()
    {
        if (
            $this->conn->getParams()['driver'] == 'pdo_mysql'
            || $this->conn->getParams()['driver'] == 'pdo_sqlite'
            || $this->conn->getParams()['driver'] == 'pdo_pgsql'
            || $this->conn->getParams()['driver'] == 'pdo_oci'
        )
        {
            $response['server_info'] = $this->conn->getNativeConnection()->getAttribute(constant('PDO::ATTR_SERVER_INFO'));
            $response['server_version'] = $this->conn->getNativeConnection()->getAttribute(constant('PDO::ATTR_SERVER_VERSION'));
        }
        else if ($this->conn->getParams()['driver'] == 'mysqli')
        {
            $stats = $this->conn->getNativeConnection()->get_connection_stats();

            $response['server_info'] = "Bytes sent: {$stats['bytes_sent']}, bytes received: {$stats['bytes_received']}.";
            $response['server_version'] = $this->conn->getNativeConnection()->get_server_info();
        }
        else if ($this->conn->getParams()['driver'] == 'sqlite3')
        {
            $response['server_info'] = null;
            $response['server_version'] = \SQLite3::version()['versionString'];
        }
        else if ($this->conn->getParams()['driver'] == 'sqlsrv')
        {
            $sqlsrv_Info = \sqlsrv_server_info($this->conn->getNativeConnection());

            $response['server_info'] = null;
            $response['server_version'] = $sqlsrv_Info['SQLServerVersion'];
        }
        else
        {
            $response['server_info'] = null;
            $response['server_version'] = null;
        }

        return $response;
    }

    public function isPlatform($platform)
    {
        if ($platform == 'mysql' && $platform == 'mysqli')
        {
            if (
                $this->conn->getParams()['driver'] == 'pdo_mysql'
                || $this->conn->getParams()['driver'] == 'mysqli'
            )
            {
                return true;
            }
        }
        else if ($platform == 'sqlite')
        {
            if (
                $this->conn->getParams()['driver'] == 'pdo_sqlite'
                || $this->conn->getParams()['driver'] == 'sqlite3'
            )
            {
                return true;
            }
        }
        else if ($platform == 'pgsql')
        {
            if (
                $this->conn->getParams()['driver'] == 'pdo_pgsql'
                || $this->conn->getParams()['driver'] == 'pgsql'
            )
            {
                return true;
            }
        }
        else if ($platform == 'sqlsrv')
        {
            if (
                $this->conn->getParams()['driver'] == 'pdo_sqlsrv'
                || $this->conn->getParams()['driver'] == 'sqlsrv'
            )
            {
                return true;
            }
        }
        else if ($platform == 'oci')
        {
            if (
                $this->conn->getParams()['driver'] == 'pdo_oci'
                || $this->conn->getParams()['driver'] == 'oci8'
            )
            {
                return true;
            }
        }
        else if ($platform == 'ibm_db2')
        {
            if ($this->conn->getParams()['driver'] == 'ibm_db2')
            {
                return true;
            }
        }

        return false;
    }
}
