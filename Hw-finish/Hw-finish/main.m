@interface Robot : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, copy) NSString *name;

@end

@implementation Robot

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание и сохранение объекта Робот в UserDefaults
        
        // Создаем объект Робот
        Robot *robot = [[Robot alloc] init];
        robot.x = 10;
        robot.y = 20;
        robot.name = @"Robot 1";
        
        // Сохраняем объект Робот в UserDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:robot] forKey:@"robot"];
        [userDefaults synchronize];
        
        // Чтение объекта Робот из UserDefaults и вывод его в TextView (или консоль)
        NSData *robotData = [userDefaults objectForKey:@"robot"];
        Robot *storedRobot = [NSKeyedUnarchiver unarchiveObjectWithData:robotData];
        NSLog(@"Stored robot: %@, x: %ld, y: %ld", storedRobot.name, (long)storedRobot.x, (long)storedRobot.y);
        
        // Запись информации о роботе в файл с названием таким же как имя робота
        
        // Получаем путь к документам приложения
        NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsDir = [docDirs objectAtIndex:0];
        
        // Формируем путь к файлу с названием таким же как имя робота
        NSString *robotFilePath = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt", robot.name]];
        
        // Записываем информацию о роботе в файл
        NSString *robotInfo = [NSString stringWithFormat:@"Name: %@, x: %ld, y: %ld", robot.name, (long)robot.x, (long)robot.y];
        [robotInfo writeToFile:robotFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        // Чтение содержимого файла и отображение в TextView (или консоль)
        NSString *fileContents = [NSString stringWithContentsOfFile:robotFilePath encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"File contents: %@", fileContents);
    }
    return 0;
}
