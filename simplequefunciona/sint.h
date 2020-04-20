/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_SINT_H_INCLUDED
# define YY_YY_SINT_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    EQ = 258,
    NE = 259,
    LT = 260,
    LE = 261,
    GT = 262,
    GE = 263,
    PLUS = 264,
    MINUS = 265,
    MULT = 266,
    DIVIDE = 267,
    RPAREN = 268,
    LPAREN = 269,
    ASSIGN = 270,
    SEMICOLON = 271,
    IF = 272,
    THEN = 273,
    ELSE = 274,
    FI = 275,
    WHILE = 276,
    DO = 277,
    OD = 278,
    PRINT = 279,
    INT = 280,
    REAL = 281,
    NAME = 282,
    CODE = 283,
    DECL = 284,
    END = 285,
    REPEAT = 286,
    UNTIL = 287,
    DOISPONTOS = 288
  };
#endif
/* Tokens.  */
#define EQ 258
#define NE 259
#define LT 260
#define LE 261
#define GT 262
#define GE 263
#define PLUS 264
#define MINUS 265
#define MULT 266
#define DIVIDE 267
#define RPAREN 268
#define LPAREN 269
#define ASSIGN 270
#define SEMICOLON 271
#define IF 272
#define THEN 273
#define ELSE 274
#define FI 275
#define WHILE 276
#define DO 277
#define OD 278
#define PRINT 279
#define INT 280
#define REAL 281
#define NAME 282
#define CODE 283
#define DECL 284
#define END 285
#define REPEAT 286
#define UNTIL 287
#define DOISPONTOS 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SINT_H_INCLUDED  */
