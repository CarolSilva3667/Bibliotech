/*
  Warnings:

  - A unique constraint covering the columns `[usuario]` on the table `usuarios` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `senha` to the `usuarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `usuarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `usuarios` ADD COLUMN `senha` VARCHAR(191) NOT NULL,
    ADD COLUMN `tipo` VARCHAR(191) NOT NULL,
    ADD COLUMN `usuario` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `alunos` (
    `rm` INTEGER NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `serie` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `alunos_rm_key`(`rm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `multas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `livro_id` INTEGER NOT NULL,
    `aluno_rm` INTEGER NOT NULL,
    `quantidade` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `usuarios_usuario_key` ON `usuarios`(`usuario`);

-- AddForeignKey
ALTER TABLE `multas` ADD CONSTRAINT `multas_livro_id_fkey` FOREIGN KEY (`livro_id`) REFERENCES `livros`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `multas` ADD CONSTRAINT `multas_aluno_rm_fkey` FOREIGN KEY (`aluno_rm`) REFERENCES `alunos`(`rm`) ON DELETE RESTRICT ON UPDATE CASCADE;
