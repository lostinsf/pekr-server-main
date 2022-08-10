-- CreateTable
CREATE TABLE `Categories` (
    `value` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`value`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Owners` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `nick_name` VARCHAR(255) NOT NULL,
    `avatar_domain` VARCHAR(255) NOT NULL,
    `avatar_blob_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Owners_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Classes` (
    `id` VARCHAR(255) NOT NULL,
    `owner_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `about` TEXT NOT NULL,
    `what_learn` TEXT NOT NULL,
    `profile_domain` VARCHAR(255) NOT NULL,
    `profile_blob_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Classes_Category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `class_id` VARCHAR(255) NOT NULL,
    `category_value` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Classes_Sessions` (
    `id` VARCHAR(255) NOT NULL,
    `class_id` VARCHAR(255) NOT NULL,
    `start_date` DATETIME(3) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_owner_id_fkey` FOREIGN KEY (`owner_id`) REFERENCES `Owners`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes_Category` ADD CONSTRAINT `Classes_Category_category_value_fkey` FOREIGN KEY (`category_value`) REFERENCES `Categories`(`value`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes_Category` ADD CONSTRAINT `Classes_Category_class_id_fkey` FOREIGN KEY (`class_id`) REFERENCES `Classes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes_Sessions` ADD CONSTRAINT `Classes_Sessions_class_id_fkey` FOREIGN KEY (`class_id`) REFERENCES `Classes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
