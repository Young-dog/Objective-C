//
//  main.m
//  LessonFirst
//
//  Created by Maxim Terekhin on 26.12.2023.
//

#import <Foundation/Foundation.h>

void solveQuadraticEquation(double a, double b, double c) {
    double discriminant = b * b - 4 * a * c;
    
    if (discriminant > 0) {
        double x1 = (-b + sqrt(discriminant)) / (2 * a);
        double x2 = (-b - sqrt(discriminant)) / (2 * a);
        
        NSLog(@"Уравнение имеет два корня: x1 = %lf, x2 = %lf", x1, x2);
    } else if (discriminant == 0) {
        double x = -b / (2 * a);
        
        NSLog(@"Уравнение имеет один корень: x = %lf", x);
    } else {
        NSLog(@"Уравнение не имеет действительных корней");
    }
}

void maxNum(double a, double b, double c) {
    int max = a;
    
    if (b > max) {
               max = b;
           }
           
           if (c > max) {
               max = c;
           }
           
           NSLog(@"Максимальное число: %d", max);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
