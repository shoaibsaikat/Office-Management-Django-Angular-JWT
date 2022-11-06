export interface Route {
    id: number;
    name: string;
    driver: number;
    driver_first_name: string;
    driver_last_name: string;
    car: string;
    model: string;
    number: string;
    active: boolean;
    description?: string;
}