package RTC_project.mapper;

import RTC_project.dto.Image;

public interface ImageMapper {
	Image selectById(int id);
	void insert(Image image);
	void deleteOrphan();
}
