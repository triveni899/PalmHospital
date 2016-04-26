//
//  ViewController.m
//  DiseaseRead
//
//  Created by Triveni Banpela on 4/23/16.
//  Copyright © 2016 Triveni Banpela. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController


@synthesize lblDiesease1,lblDisease2,lblDisease3,lblDisease4,lblSymptom,lblTimer,lblCorrect;
@synthesize Switch1val,Switch2val,Switch3val,Switch4val;

@synthesize counter;

NSString *result, *disease1Result, *disease2Result, *disease3Result;
int randomSymptom,randomDisease1,randomDisease2,randomDisease3,randomResult,randomResult1,randomResult2,
randomResult3;

NSTimer *timer;
int remainingCounts;

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bground.jpg"]];
    [super viewDidLoad];
  
    // Do any additional setup after loading the view, typically from a nib.
    [self readCSV];
    [self assignDisease:randomResult val:result];
    [self assignDisease:randomResult1 val:disease1Result];
    [self assignDisease:randomResult2 val:disease2Result];
    [self assignDisease:randomResult3 val:disease3Result];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(onTick)
                                           userInfo:nil
                                            repeats:YES];
    
    
    
   
    remainingCounts = 30;
    
    
}

-(void)onTick
{
    //do what ever you want
   // NSLog(@"i am called for every 1 sec");
    [lblTimer setText:[NSString stringWithFormat:@"%d", remainingCounts]];
    
    
    //invalidate after 60 sec [timer invalidate];
     if(remainingCounts == 0)
     {
         [timer invalidate];
         [lblTimer setText:@"Your time is Over!!!"];
         
     }
     remainingCounts--;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)readCSV{
    
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"data" ofType:@"txt"];
    NSStringEncoding encoding;
    NSError *error;
    NSString *fileContents = [[NSString alloc] initWithContentsOfFile:filePath
                                                          usedEncoding:&encoding
                                                                 error:&error];
    
    //NSLog(@"filecontents:  %@",fileContents);
 
    
    NSArray* rows = [fileContents componentsSeparatedByString:@"\n"];
    int numofrows = rows.count-1;
    randomSymptom =  [self getRandomNumberBetween:0 to:numofrows];
     randomResult   = [self getRandomNumberBetween:1 to:4];
    
    
   
    
    for (int i = 0; i < rows.count; i ++)
    {
        NSString* row = [rows objectAtIndex:i];
        
        NSArray* columns = [row componentsSeparatedByString:@","];
        
        //[colA addObject:columns[0]];
        //[colB addObject:columns[1]];
        NSString *columnval= @" ";
        NSString *comma = @",";
        if(i==randomSymptom)
        {
            for(int j=0; j<columns.count-1;j++)
            {
               // columnval = columnval + columns[j];
                NSString *columnstr = columns[j];
                NSLog(@"columnstr:  %@",columnstr);
               // NSString *newString = [NSString stringWithFormat:@"Hello, %@ blah blah", variable];
                
                columnval = [columnval stringByAppendingString:columnstr];
                if(j<columns.count-2)
                {
                columnval = [columnval stringByAppendingString:comma];
                }
                
                //string1 = [string1 stringByAppendingString:string2];
                 NSLog(@"columnval:  %@",columnval);
            NSLog(@"columns:  %@",columns[j]);
            }
            result = columns[columns.count-1];
            [lblSymptom setText:(columnval)];
            NSLog(@"columnval:  %@",columnval);
            NSLog(@"result:  %@",result);
            
            randomDisease1 = [self getRandomNumberBetween:0 to:numofrows];
            while(randomDisease1 == randomSymptom)
            {
                randomDisease1 = [self getRandomNumberBetween:0 to:numofrows];
            }
            
            randomDisease2 = [self getRandomNumberBetween:0 to:numofrows];
            while((randomDisease2 == randomSymptom) || (randomDisease2 == randomDisease1))
            {
                 randomDisease2 = [self getRandomNumberBetween:0 to:numofrows];
            }
            
            randomDisease3 = [self getRandomNumberBetween:0 to:numofrows];
            while((randomDisease3 == randomSymptom) || (randomDisease3 == randomDisease2) || (randomDisease3 == randomDisease1))
            {
                randomDisease3 = [self getRandomNumberBetween:0 to:numofrows];
            }
        }
        
        
      
    }
    
    
    
    //other options assign
    
    
    for (int i = 0; i < rows.count; i ++)
    {
        NSString* row = [rows objectAtIndex:i];
        
        NSArray* columns = [row componentsSeparatedByString:@","];
        
        
        NSString *columnval= @" ";
       
           if (i==randomDisease1)
           {
               disease1Result = columns[columns.count-1];
               
           } else if (i==randomDisease2)
           {
               disease2Result = columns[columns.count-1];
           } else if (i==randomDisease3)
           {
               disease3Result = columns[columns.count-1];
               
           }
        
        
    }
    
    
    
    //set option number to display
    
    randomResult1 = [self getRandomNumberBetween:1 to:4];
    while(randomResult1 == randomResult)
    {
        randomResult1 = [self getRandomNumberBetween:1 to:4];
    }
    
    randomResult2 = [self getRandomNumberBetween:1 to:4];
    while((randomResult2 == randomResult) || (randomResult2 == randomResult1))
    {
        randomResult2 = [self getRandomNumberBetween:1 to:4];
    }
    
    randomResult3 = [self getRandomNumberBetween:1 to:4];
    while((randomResult3 == randomResult) || (randomResult3 == randomResult1) || (randomResult3 == randomResult2))
    {
        randomResult3 = [self getRandomNumberBetween:1 to:4];
    }
    
    
}







-(void)assignDisease:(int)parm val:(NSString *)val{
   
    switch(parm)
    {
        case 1:
            [lblDiesease1 setText:val];
            break;
        case 2:
            [lblDisease2 setText:val];
            break;
        case 3:
            [lblDisease3 setText:val];
            break;
        case 4:
            [lblDisease4 setText:val];
            break;
        default:
            break;
    }
    
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

-(void)setSwitch1val:(UISwitch *)Switch1val
{
    
}

- (IBAction)Switch1:(id)sender {
    
    
    if(![Switch1val isOn])
        [Switch1val setOn:YES animated:YES];
    
    if([Switch2val isOn])
        [Switch2val setOn:NO animated:YES];
    
    if([Switch3val isOn])
        [Switch3val setOn:NO animated:YES];
    
    if([Switch4val isOn])
        [Switch4val setOn:NO animated:YES];
    
    
    
    
    
}

- (IBAction)Switch2:(id)sender {
    
    
    if(![Switch2val isOn])
        [Switch2val setOn:YES animated:YES];
    
    if([Switch1val isOn])
        [Switch1val setOn:NO animated:YES];
    
    if([Switch3val isOn])
        [Switch3val setOn:NO animated:YES];
    
    if([Switch4val isOn])
        [Switch4val setOn:NO animated:YES];

    
    }

- (IBAction)Switch3:(id)sender {
    
    if(![Switch3val isOn])
        [Switch3val setOn:YES animated:YES];
    
    if([Switch1val isOn])
        [Switch1val setOn:NO animated:YES];
    
    if([Switch2val isOn])
        [Switch2val setOn:NO animated:YES];
    
    if([Switch4val isOn])
        [Switch4val setOn:NO animated:YES];
    
    
    }

- (IBAction)Switch4:(id)sender {
    
    if(![Switch4val isOn])
        [Switch4val setOn:YES animated:YES];
    
    if([Switch1val isOn])
        [Switch1val setOn:NO animated:YES];
    
    if([Switch3val isOn])
        [Switch3val setOn:NO animated:YES];
    
    if([Switch2val isOn])
        [Switch2val setOn:NO animated:YES];

    
    
   }


- (IBAction)ResetButton:(id)sender {
    
     [timer invalidate];
    [self readCSV];
    [self assignDisease:randomResult val:result];
    [self assignDisease:randomResult1 val:disease1Result];
    [self assignDisease:randomResult2 val:disease2Result];
    [self assignDisease:randomResult3 val:disease3Result];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(onTick)
                                           userInfo:nil
                                            repeats:YES];
    
    [lblCorrect setText:@" "];
    
    [Switch1val setOn:NO animated:YES];
    
    [Switch2val setOn:NO animated:YES];
   
    [Switch3val setOn:NO animated:YES];
    
    [Switch4val setOn:NO animated:YES];
    
    remainingCounts = 30;
    

    
}

- (IBAction)SubmitButton:(id)sender {
    
    if([Switch1val isOn])
    {
        if((![Switch2val isOn]) && (![Switch3val isOn]) && (![Switch4val isOn]) )
        {
            if([lblDiesease1.text isEqualToString:result])
            {
                [lblCorrect setText:@"Correct Diagnosis,You can start the treatment!!!"];
                //show you won
                
                
            }
            else
            {
                [lblCorrect setText:@"Sorry, Incorrect Diagnosis!!!"];
            }
        }
        else
        {
            [lblCorrect setText:@"Please select only one Option"];
        }
    }
    
    //check for switch2Val
    
    else if([Switch2val isOn])
        {
            if((![Switch1val isOn]) && (![Switch3val isOn]) && (![Switch4val isOn]) )
            {
                if([lblDisease2.text isEqualToString:result])
                {
                    [lblCorrect setText:@"Correct Diagnosis,You can start the treatment!!!"];
                    //show you won
                    
                    
                }
                else
                {
                    [lblCorrect setText:@"Sorry, Incorrect Diagnosis!!!"];
                }
            }
            else
            {
                [lblCorrect setText:@"Please select only one Option"];
            }
        }
    //check for switch3
    
    else if([Switch3val isOn])
    {
        if((![Switch1val isOn]) && (![Switch2val isOn]) && (![Switch4val isOn]) )
        {
            if([lblDisease3.text isEqualToString:result])
            {
                [lblCorrect setText:@"Correct Diagnosis,You can start the treatment!!!"];
                //show you won
                
                
            }
            else
            {
                [lblCorrect setText:@"Sorry, Incorrect Diagnosis!!!"];
            }
        }
        else
        {
            [lblCorrect setText:@"Please select only one Option"];
        }
    }
    
    
    
    //check for switch 4
    else if([Switch4val isOn])
    {
        if((![Switch1val isOn]) && (![Switch3val isOn]) && (![Switch2val isOn]) )
        {
            if([lblDisease4.text isEqualToString:result])
            {
                [lblCorrect setText:@"Correct Diagnosis,You can start the treatment!!!"];
                //show you won
                
                
            }
            else
            {
                [lblCorrect setText:@"Sorry, Incorrect Diagnosis!!!"];
            }
        }
        else
        {
            [lblCorrect setText:@"Please select only one Option"];
        }
    }
    
    [timer invalidate];
    
}







@end
