public class ComplexNumber {
    private double real;
    private double imaginary;

    public ComplexNumber(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    public ComplexNumber add(ComplexNumber other) {
        return new ComplexNumber(this.real + other.real, this.imaginary + other.imaginary);
    }

    public ComplexNumber multiply(ComplexNumber other) {
        double real = this.real * other.real - this.imaginary * other.imaginary;
        double imaginary = this.real * other.imaginary + this.imaginary * other.real;
        return new ComplexNumber(real, imaginary);
    }

    public ComplexNumber divide(ComplexNumber other) {
        double denominator = other.real * other.real + other.imaginary * other.imaginary;
        double real = (this.real * other.real + this.imaginary * other.imaginary) / denominator;
        double imaginary = (this.imaginary * other.real - this.real * other.imaginary) / denominator;
        return new ComplexNumber(real, imaginary);
    }
}

public class ComplexNumberFactory {
    public static ComplexNumber create(double real, double imaginary) {
        return new ComplexNumber(real, imaginary);
    }
}

public class ComplexNumberLogger {
    private static final Logger LOGGER = LoggerFactory.getLogger(ComplexNumberLogger.class);

    public static void log(String message) {
        LOGGER.info(message);
    }
}

public class ComplexNumberCalculator {
    public static void main(String[] args) {
        ComplexNumber a = ComplexNumberFactory.create(1, 2);
        ComplexNumber b = ComplexNumberFactory.create(3, 4);

        ComplexNumber sum = a.add(b);
        ComplexNumberLogger.log("Sum: " + sum.real + " + " + sum.imaginary + "i");

        ComplexNumber product = a.multiply(b);
        ComplexNumberLogger.log("Product: " + product.real + " + " + product.imaginary + "i");

        ComplexNumber quotient = a.divide(b);
        ComplexNumberLogger.log("Quotient: " + quotient.real + " + " + quotient.imaginary + "i");
    }
}
