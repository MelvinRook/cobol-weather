# Average Temperature Calculator

This COBOL program reads daily temperature data for the last 10 days from a file, calculates the average temperature, and then displays the result.

## Program Structure

The program is divided into the following sections:

1. **Identification Division**: Identifies the program.
2. **Environment Division**: Specifies the file to read from.
3. **Data Division**: Defines the structure of the temperature data file.
4. **Working-Storage Section**: Contains variables used in calculations and control logic.
5. **Procedure Division**: Contains the logic to read the temperature data, calculate the average, and display the result.

## File Structure

The input file, `temperature.dat`, should contain records with the following structure:

- **Temperature Date**: 10 characters (e.g., `2023-08-01`)
- **Daily Temperature**: Signed numeric value with one decimal place (e.g., `23.5`)

Each record should be on a new line.

## How to Run the Program

1. **Compile the COBOL Program**: Use your COBOL compiler to compile the `AverageTemperatureCalculator.cob` program.

   ```sh
   cobc -x -o AverageTemperatureCalculator AverageTemperatureCalculator.cob
   ```

2. **Prepare the Input File**: Ensure that `temperature.dat` is in the same directory as the compiled program and contains the last 10 days of temperature data.

3. **Execute the Program**: Run the compiled program.

   ```sh
   ./AverageTemperatureCalculator
   ```

4. **View the Output**: The program will display the average temperature for the last 10 days.

## Example

Given an input file `temperature.dat` with the following content:

```
2024-07-30  25.5
2024-07-31  24.0
2024-08-01  23.5
2024-08-02  26.0
2024-08-03  27.0
2024-08-04  22.5
2024-08-05  24.5
2024-08-06  25.0
2024-08-07  23.0
2024-08-08  24.0
```

The program will output:

```
Average Temperature for Last 10 Days: 24.6
```

## Notes

- Ensure that the input file is formatted correctly and contains data for exactly 10 days.
- The program assumes that the temperature values are in degrees Celsius.
