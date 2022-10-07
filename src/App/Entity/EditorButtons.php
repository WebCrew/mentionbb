<?php

namespace App\Entity;

use App\Entity\Mapper;

class EditorButtons extends Mapper
{
    public function __construct()
    {
        parent::__construct();

        $this->setTable('editor_buttons');
    }

    public function buttonList($is_active = true)
    {
        if ($is_active)
        {
            $isActive_Query = "WHERE b.is_active = :is_active";
        }
        else
        {
            $isActive_Query = "";
        }

        $query = $this->conn->prepare("SELECT b.*, t.*
			FROM {$this->table} b

			LEFT JOIN editor_toolbars t 
			ON t.toolbar_id = b.toolbar_id

			{$isActive_Query}

            ORDER BY b.toolbar_id
			");

        if ($is_active)
        {
            $query->bindValue('is_active', 1, \PDO::PARAM_INT);
        }

        $fetch = $query->execute()->fetchAllAssociative();

        $this->conn->close();

        return $fetch;
    }

    public function toolbarList()
    {
        $query = $this->conn->createQueryBuilder()
            ->select('*')
            ->from('editor_toolbars')
            ->where('is_active = ?')
            ->orderBy('order_by', 'ASC')
            ->setParameter(0, 1)
            ->execute()->fetchAllAssociative();

        $this->conn->close();

        return $query;
    }

    public function toolbarNonactiveList()
    {
        $query = $this->conn->createQueryBuilder()
            ->select('*')
            ->from('editor_toolbars')
            ->where('is_active = ?')
            ->orderBy('order_by', 'ASC')
            ->setParameter(0, 0)
            ->execute()->fetchAllAssociative();

        $this->conn->close();

        return $query;
    }

    public function changeOrderToolbars($data, $active = 1)
    {
        if (count($data) > 0)
        {
            foreach ($data as $id => $order)
            {
                $query = $this->conn->createQueryBuilder()->update('editor_toolbars')
                    ->set('order_by', '?')
                    ->set('is_active', '?')
                    ->where('toolbar_id = ?')
                    ->setParameter(0, $order)
                    ->setParameter(1, $active)
                    ->setParameter(2, $id);

                $query->execute();

                $this->conn->close();
            }
        }

        return true;
    }

    public function getButton($button_id)
    {
        $query = $this->conn->prepare("SELECT b.*, t.*
			FROM {$this->table} b

			LEFT JOIN editor_toolbars t 
			ON t.toolbar_id = b.toolbar_id

			WHERE b.button_id = :button_id
			");

        $query->bindValue('button_id', $button_id, \PDO::PARAM_INT);

        $fetch = $query->execute()->fetchAssociative();

        $this->conn->close();

        return $fetch;
    }

    public function editToolbars(string $toolbar, string $alias, string $button, string $icon, int $order_by, int $id)
    {
        $query = $this->conn->createQueryBuilder()->update('editor_toolbars')
            ->set('toolbar', '?')
            ->set('alias', '?')
            ->set('button', '?')
            ->set('icon', '?')
            ->set('order_by', '?')
            ->where('toolbar_id = ?')
            ->setParameter(0, $toolbar)
            ->setParameter(1, $alias)
            ->setParameter(2, $button)
            ->setParameter(3, $icon)
            ->setParameter(4, $order_by)
            ->setParameter(5, $id);

        $query->execute();

        $this->conn->close();
    }

    public function editToolbarsFull(string $toolbar, string $alias, string $button, string $icon, int $order_by, int $is_active, int $id)
    {
        $query = $this->conn->createQueryBuilder()->update('editor_toolbars')
            ->set('toolbar', '?')
            ->set('alias', '?')
            ->set('button', '?')
            ->set('icon', '?')
            ->set('order_by', '?')
            ->set('is_active', '?')
            ->where('toolbar_id = ?')
            ->setParameter(0, $toolbar)
            ->setParameter(1, $alias)
            ->setParameter(2, $button)
            ->setParameter(3, $icon)
            ->setParameter(4, $order_by)
            ->setParameter(5, $is_active)
            ->setParameter(6, $id);

        $query->execute();

        $this->conn->close();
    }

    public function editButtons(string $tag, string $replace_text, string $bbcode, int $is_string, int $is_single, int $button_id, int $is_active)
    {
        $query = $this->conn->createQueryBuilder()->update($this->table)
            ->set('tag', '?')
            ->set('replace_text', '?')
            ->set('bbcode', '?')
            ->set('is_string', '?')
            ->set('is_single', '?')
            ->set('is_active', '?')
            ->where('button_id = ?')
            ->setParameter(0, $tag)
            ->setParameter(1, $replace_text)
            ->setParameter(2, $bbcode)
            ->setParameter(3, $is_string)
            ->setParameter(4, $is_single)
            ->setParameter(5, $is_active)
            ->setParameter(6, $button_id);

        $query->execute();

        $this->conn->close();
    }
}
