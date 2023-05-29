//MARK: - Task
/*
 Задание 1
 
 Условия задачи:
 На вход подается матрица A x B (1 <= A, B <= 10^3; 1 <= A * B <= 10^3). Значение каждой ячейки - целое число 0 или 1.
 Найти наименьшее расстояние от каждой ячейки до ближайшей ячейки со значением 1. Расстояние между соседними ячейками равно 1.
 
 Пример:
 Входная матрица:
 [[1,0,1],
 [0,1,0],
 [0,0,0]]
 Выходная матрица:
 [[0,1,0],
 [1,0,1],
 [2,1,2]]
 */

//MARK: - Solution class
class Solution {
    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    func findDistance(_ matrix: [[Int]]) -> [[Int]] {
        let rows: Int
        let columns: Int
        
        guard let firstRowCount = matrix.first?.count, firstRowCount != 0 else {
            return matrix }
        columns = firstRowCount
        rows = matrix.count
        
        
        // 1. Create dist matrix
        var dist: [[Int]] = Array(
            repeating: Array(
                repeating: Int.max - 1,
                count: columns),
            count: rows)
        
        // breadth first search
        func bfs(_ matrix: [[Int]], _ dist: inout [[Int]], _ start: Point) {
            var visited: Set<Point> = .init()
            var deq: Deque<Point> = .init()
            deq.enqueueRear(start)
            visited.insert(start)
            
            while !deq.isEmpty {
                guard let pair = deq.dequeueFront() else { return }
                
                let x = pair.x, y = pair.y
                
                for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                    let nx = x + dx
                    let ny = y + dy
                    let newPoint = Point(nx, ny)
                    
                    if nx < 0 || nx >= rows || ny < 0 || ny >= columns {
                        continue
                    }
                    
                    if visited.contains(newPoint) {
                        continue
                    }
                    
                    visited.insert(newPoint)
                    dist[nx][ny] = min(dist[nx][ny], dist[x][y] + 1)
                    deq.enqueueRear(newPoint)
                }
            }
        }
        
        // 2. ForEach 1 do bfs and change dist in matrix
        for i in 0..<rows {
            for j in 0..<columns {
                if matrix[i][j] == 1 {
                    dist[i][j] = 0
                    bfs(matrix, &dist, Point(i, j))
                }
            }
        }
        
        
        return dist
    }
    
}

let solver = Solution()
//MARK: - Example 1
// Given
var inputMatrix: [[Int]] = [[1, 0, 0],
                            [0, 0, 0],
                            [0, 0, 0]]
var expectation: [[Int]] = [[0, 1, 2],
                            [1, 2, 3],
                            [2, 3, 4]]
//print("Input: ", inputMatrix)
// When
var answer = solver.findDistance(inputMatrix)
//print("Output: ", answer)
//Then
if answer == expectation { print(">>>Example 1: passed") } else { ">>>Example 1: NOT passed"}


//MARK: - Example 2
// Given
inputMatrix = [[1, 0, 1],
                [0, 1, 0],
                [0, 0, 0]]
expectation = [[0,1,0],
               [1,0,1],
               [2,1,2]]
//print("Input: ", inputMatrix)
// When
answer = solver.findDistance(inputMatrix)
//print("Output: ", answer)
//Then
if answer == expectation { print(">>>Example 2: passed") } else { ">>>Example 2: NOT passed"}

//MARK: - Example 3
// Given
inputMatrix = [[1, 0, 1]]
expectation = [[0,1,0]]
//print("Input: ", inputMatrix)
// When
answer = solver.findDistance(inputMatrix)
//print("Output: ", answer)
//Then
if answer == expectation { print(">>>Example 3: passed") } else { ">>>Example 3: NOT passed"}

//MARK: - Example 4
// Знаю, что не в констрейнте задачи, но все же edge case поэтому решение учитывает и его
// Given
inputMatrix = [[]]
expectation = [[]]
//print("Input: ", inputMatrix)
// When
answer = solver.findDistance(inputMatrix)
//print("Output: ", answer)
//Then
if answer == expectation { print(">>>Example 4: passed") } else { ">>>Example 4: NOT passed"}

//MARK: - Example 5
// Given
inputMatrix = [[0, 0, 0],
               [0, 0, 0],
               [0, 0, 0]]
let val = Int.max - 1
expectation = [[val, val, val],
               [val, val, val],
               [val, val, val]]
//print("Input: ", inputMatrix)
// When
answer = solver.findDistance(inputMatrix)
//print("Output: ", answer)
//Then
if answer == expectation { print(">>>Example 5: passed") } else { ">>>Example 5: NOT passed"}
