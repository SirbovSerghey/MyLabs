#include <iostream>
#include <cstdlib>
#include <ctime>
#include <iomanip>

bool checkCondition(const int numbers[]) {
    return (numbers[0] + numbers[1] + numbers[2] == numbers[3] + numbers[4] + numbers[5]);
}

int main() {
    // Инициализация генератора случайных чисел
    srand(static_cast<unsigned int>(time(nullptr)));

    std::cout << "Monte Carlo Simulation to Estimate Probability P(4)" << std::endl;

    // Количество экспериментов
    const int totalExperiments = 10000;

    std::cout << "Running experiments..." << std::endl;

    for (int experiment = 1; experiment <= totalExperiments; ++experiment) {
        // Генерация случайных чисел от 0 до 9
        int numbers[6];
        for (int i = 0; i < 6; ++i) {
            numbers[i] = rand() % 10;
        }

        // Вращение чисел
        for (int i = 0; i < 3; ++i) {
            int temp = numbers[i];
            numbers[i] = numbers[i + 3];
            numbers[i + 3] = temp;
        }

        // Вывод информации о текущем эксперименте
        std::cout << "Experiment " << std::setw(4) << experiment << ": ";
        for (int i = 0; i < 6; ++i) {
            std::cout << numbers[i] << " ";
        }

        // Проверка условия завершения
        if (checkCondition(numbers)) {
            std::cout << " [Condition Met]" << std::endl;
            break;
        }
        else {
            std::cout << " [Condition Not Met]" << std::endl;
        }

        // Визуализация прогресса (прогресс-бар)
        if (experiment % (totalExperiments / 20) == 0) {
            std::cout << "[" << std::setw(3) << static_cast<int>(static_cast<double>(experiment) / totalExperiments * 100) << "%] ";
            for (int i = 0; i < 50 * experiment / totalExperiments; ++i) {
                std::cout << "=";
            }
            std::cout << ">" << std::endl;
        }
    }

    std::cout << "Simulation complete!" << std::endl;

    return 0;
}



