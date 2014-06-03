stock IsPointInPolygon(Float: point_X, Float: point_Y, { Float, _ }: ...)  // Author: RyDeR`
{
    #define MAX_POINTS (32)
    
    new
        args_Total = numargs(),
        polygon_Sides = (args_Total - 2) / 2
    ;
    if((args_Total - 2) & 0b1 || MAX_POINTS <= polygon_Sides || polygon_Sides < 3)
        return 0;
        
    new
        Float: polygon_Data[2][MAX_POINTS],
        cross_Total
    ;
    #undef MAX_POINTS
    
    for(new i = 2, j; i < args_Total; i += 2, ++j)
    {
        polygon_Data[0][j] = Float: getarg(i);
        polygon_Data[1][j] = Float: getarg(i + 1);
    }
    for(new i, j = polygon_Sides - 1; i < polygon_Sides; j = i, ++i)
    {
        if(polygon_Data[1][i] < point_Y && polygon_Data[1][j] >= point_Y || polygon_Data[1][j] < point_Y && polygon_Data[1][i] >= point_Y)
        {
            if(polygon_Data[0][i] + (point_Y - polygon_Data[1][i]) / (polygon_Data[1][j] - polygon_Data[1][i]) * (polygon_Data[0][j] - polygon_Data[0][i]) < point_X)
            {
                cross_Total++;
            }
        }
    }
    return cross_Total & 0b1;   
}