<?php

namespace App\Entity;

use App\Entity\Mapper;

class AttachmentFileTypes extends Mapper
{
	public function __construct()
	{
		parent::__construct();

		$this->setTable('attachment_filetypes');
	}

	public function getFileTypes()
	{
		$query = $this->conn->createQueryBuilder()
			->select('*')
			->from($this->table)
			->where('is_active = ?')
			->setParameter(0, 1)
			->execute()->fetchAllAssociative();

		$this->conn->close();

		return $query;
	}

	public function getAllFileTypes()
	{
		$query = $this->conn->createQueryBuilder()
			->select('*')
			->from($this->table)
			->execute()->fetchAllAssociative();

		$this->conn->close();

		return $query;
	}

	public function getMime(string $type_id)
	{
		$query = $this->conn->createQueryBuilder()
			->select('*')
			->from($this->table)
			->where('is_active = ?')
			->andWhere('type_id = ?')
			->setParameter(0, 1)
			->setParameter(1, $type_id)
			->execute()->fetchAssociative();

		$this->conn->close();

		return $query;
	}

	public function getMimeFromExtension(string $extension)
	{
		$query = $this->conn->createQueryBuilder()
			->select('*')
			->from($this->table)
			->where('extension = ?')
			->setParameter(0, $extension)
			->execute()->fetchAssociative();

		$this->conn->close();

		return $query;
	}

	public function createFileType(string $extension, string $mime_type, string $icon, int $is_active)
	{
		$query = $this->conn->createQueryBuilder()
			->insert($this->table)
			->values([
				'extension' => '?',
				'mime_type' => '?',
				'icon' => '?',
				'is_active' => '?'
			])
			->setParameter(0, $extension)
			->setParameter(1, $mime_type)
			->setParameter(2, $icon)
			->setParameter(3, $is_active)
			->execute();

		$this->conn->close();

		return $query;
	}

	public function editFileType(string $extension, string $mime_type, string $icon, int $type_id, $is_active = 1)
	{
		$query = $this->conn->createQueryBuilder()->update($this->table)
			->set('extension', '?')
			->set('mime_type', '?')
			->set('icon', '?')
			->set('is_active', '?')
			->where('type_id = ?')
			->setParameter(0, $extension)
			->setParameter(1, $mime_type)
			->setParameter(2, $icon)
			->setParameter(3, $is_active)
			->setParameter(4, $type_id)
			->execute();

		$this->conn->close();

		return $query;
	}

	public function setActiveFileType($type_id, $active = 1)
	{
		$query = $this->conn->createQueryBuilder()->update($this->table)
			->set('is_active', '?')
			->where('type_id = ?')
			->setParameter(0, $active)
			->setParameter(1, $type_id)
			->execute();

		$this->conn->close();

		return $query;
	}
}
