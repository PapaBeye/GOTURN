project "GOTURN"
	location "%{wks.location}/vendor/GOTURN"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"
	targetdir ("%{wks.location}/build/install" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/build/objdir/" ..  outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.location}/src/helper/**.h",
        "%{prj.location}/src/helper/**.cpp",
        "%{prj.location}/src/loader/**.h",
        "%{prj.location}/src/loader/**.cpp",
        "%{prj.location}/src/network/**.h",
        "%{prj.location}/src/network/**.cpp",
        "%{prj.location}/src/tracker/**.h",
        "%{prj.location}/src/tracker/**.cpp",
        "%{prj.location}/src/train/**.h",
        "%{prj.location}/src/train/**.cpp"
		
	}
    excludes { "%{prj.location}/src/train/pretrain.cpp" }

    includedirs
	{
		"%{prj.location}/src",
        "%{prj.location}/src/native",
        "%{IncludeDir.Caffe}",
        "%{IncludeDir.OpenCV}",
        "%{IncludeDir.Cuda}"
	}

	libdirs 
    {
        "%{LibDir.OpenCV}",
        "%{LibDir.caffe}",
		"%{LibDir.Cuda}"

	}
    links
    {
        "cusolver",
        "caffe",
        "cufft",
		"cudart",
        "cusparse",
        "cufftw",
        "curand",
        "opencv_highgui",
        "opencv_imgproc",
        "opencv_videoio",
        "opencv_core",
        "opencv_cudaarithm",
        "opencv_cudafeatures2d",
        "opencv_cudalegacy",
        "opencv_cudastereo",
        "opencv_cudabgsegm",
        "opencv_cudafilters",
        "opencv_cudaobjdetect",
        "opencv_cudawarping",
        "opencv_cudacodec",
        "opencv_cudaimgproc",
        "opencv_cudaoptflow",
        "opencv_cudev",
        "boost_system",
        "boost_filesystem",
        "boost_regex",
        "tinyxml",
        "pthread",

    }

	filter "configurations:Debug"
		defines "S_DEBUG"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		runtime "Release"
		optimize "on"