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
    UAU = 258,
    EQ = 259,
    NE = 260,
    LT = 261,
    LE = 262,
    GT = 263,
    GE = 264,
    PLUS = 265,
    MINUS = 266,
    MULT = 267,
    DIVIDE = 268,
    RPAREN = 269,
    LPAREN = 270,
    ASSIGN = 271,
    SEMICOLON = 272,
    DOISPONTOS = 273,
    PRINT = 274,
    IF = 275,
    THEN = 276,
    ELSE = 277,
    FI = 278,
    WHILE = 279,
    DO = 280,
    OD = 281,
    NAME = 282,
    NUMREAL = 283,
    NUMINT = 284,
    REAL = 285,
    INT = 286,
    DECL = 287,
    CODE = 288,
    END = 289,
    REPEAT = 290,
    UNTIL = 291
  };
#endif
/* Tokens.  */
#define UAU 258
#define EQ 259
#define NE 260
#define LT 261
#define LE 262
#define GT 263
#define GE 264
#define PLUS 265
#define MINUS 266
#define MULT 267
#define DIVIDE 268
#define RPAREN 269
#define LPAREN 270
#define ASSIGN 271
#define SEMICOLON 272
#define DOISPONTOS 273
#define PRINT 274
#define IF 275
#define THEN 276
#define ELSE 277
#define FI 278
#define WHILE 279
#define DO 280
#define OD 281
#define NAME 282
#define NUMREAL 283
#define NUMINT 284
#define REAL 285
#define INT 286
#define DECL 287
#define CODE 288
#define END 289
#define REPEAT 290
#define UNTIL 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SINT_H_INCLUDED  */
