classdef ftir_data
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        transmittance % transmittance
        lambda % wavlength
        maxT % peak transmittance
        cl % center wavelength
        attenuation
        fwhm % full width half maximum
    end
    
    methods
        function obj = untitled6(csv_name) % function takes the csv data
            %UNTITLED6 Construct an instance of this class
            %   Detailed explanation goes here
            %obj.Property1 = wavlength + inputArg2;
            A = readmatrix(csv_name)
            obj.transmittance = A(:,1);
            obj.lambda = A(:,2);
            
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

