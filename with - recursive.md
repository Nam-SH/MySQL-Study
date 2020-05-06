## 1. WITH문을 RECURSIVE 구현

### 1-1 테이블 생성

```mysql
CREATE TABLE emp
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    ename     VARCHAR(255),
    parent_id INT DEFAULT 0 REFERENCES id
);

INSERT INTO emp
VALUES (1, 'name1', 0),
       (2, 'name2', 1),
       (3, 'name3', 1),
       (4, 'name4', 3),
       (5, 'name5', 0),
       (6, 'name6', 3),
       (7, 'name7', 4),
       (8, 'name8', 5),
       (9, 'name9', 8),
       (10, 'name10', 8);
```

### 1-1-1. EMP 테이블

![image](https://user-images.githubusercontent.com/50367487/81135795-7c34fa80-8f94-11ea-98d2-e09576bee9dd.png) 

### 1-2 구현

```mysql
WITH RECURSIVE tmp1 AS
                   (
                       SELECT id,
                              ename,
                              parent_id,
                              ename AS path,
                              0     AS lvl
                       FROM emp
                       WHERE parent_id = 0
                       UNION ALL
                       SELECT e.id,
                              e.ename,
                              e.parent_id,
                              CONCAT(t.path, ',', e.ename) AS path,
                              t.lvl + 1                    AS lvl
                       FROM tmp1 t
                                JOIN emp e ON t.id = e.parent_id
                   )


SELECT id, CONCAT(REPEAT(' ', lvl * 4), ename) ename, parent_id, path, lvl
FROM tmp1
ORDER BY path;
```

### 1-2-1 결과

![image](https://user-images.githubusercontent.com/50367487/81135773-6de6de80-8f94-11ea-860f-a70d2141844a.png)