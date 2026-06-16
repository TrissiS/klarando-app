.class public final Le/a/b/a/b;
.super Ljava/lang/Object;
.source "Factory.java"


# static fields
.field public static e:Ljava/util/Hashtable;


# instance fields
.field public a:Ljava/lang/Class;

.field public b:Ljava/lang/ClassLoader;

.field public c:Ljava/lang/String;

.field public d:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    .line 2
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const-string v2, "void"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string v2, "boolean"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const-string v2, "byte"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    const-string v2, "char"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    const-string v2, "short"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string v2, "int"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-string v2, "long"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-string v2, "float"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const-string v2, "double"

    invoke-virtual {v0, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Le/a/b/a/b;->c:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Le/a/b/a/b;->a:Ljava/lang/Class;

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Le/a/b/a/b;->d:I

    .line 5
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    iput-object p1, p0, Le/a/b/a/b;->b:Ljava/lang/ClassLoader;

    return-void
.end method

.method public static a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;
    .registers 7

    .line 7
    new-instance v0, Le/a/b/a/c;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    invoke-direct {v0, p0, p1, p2, v1}, Le/a/b/a/c;-><init>(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3

    const-string v0, "*"

    .line 1
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_a
    sget-object v0, Le/a/b/a/b;->e:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_15

    return-object v0

    :cond_15
    if-nez p1, :cond_1c

    .line 3
    :try_start_17
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0

    :cond_1c
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0
    :try_end_21
    .catch Ljava/lang/ClassNotFoundException; {:try_start_17 .. :try_end_21} :catch_22

    return-object p0

    .line 5
    :catch_22
    const-class p0, Ljava/lang/ClassNotFoundException;

    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;
    .registers 7

    .line 6
    new-instance v0, Le/a/b/a/c$a;

    iget v1, p0, Le/a/b/a/b;->d:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Le/a/b/a/b;->d:I

    const/4 v2, -0x1

    invoke-virtual {p0, p3, v2}, Le/a/b/a/b;->a(II)Le/a/a/e/d;

    move-result-object p3

    invoke-direct {v0, v1, p1, p2, p3}, Le/a/b/a/c$a;-><init>(ILjava/lang/String;Le/a/a/d;Le/a/a/e/d;)V

    return-object v0
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;
    .registers 18

    move-object v0, p0

    const/16 v1, 0x10

    move-object v2, p1

    .line 10
    invoke-static {p1, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    .line 11
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v2, ":"

    move-object v4, p4

    invoke-direct {v1, p4, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v4

    .line 13
    new-array v6, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_18
    if-ge v7, v4, :cond_29

    .line 14
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v0, Le/a/b/a/b;->b:Ljava/lang/ClassLoader;

    invoke-static {v8, v9}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v8

    aput-object v8, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_18

    .line 15
    :cond_29
    new-instance v1, Ljava/util/StringTokenizer;

    move-object v4, p5

    invoke-direct {v1, p5, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v4

    .line 17
    new-array v7, v4, [Ljava/lang/String;

    const/4 v8, 0x0

    :goto_36
    if-ge v8, v4, :cond_41

    .line 18
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_36

    .line 19
    :cond_41
    new-instance v1, Ljava/util/StringTokenizer;

    move-object/from16 v4, p6

    invoke-direct {v1, v4, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v2

    .line 21
    new-array v8, v2, [Ljava/lang/Class;

    :goto_4e
    if-ge v5, v2, :cond_5f

    .line 22
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    iget-object v9, v0, Le/a/b/a/b;->b:Ljava/lang/ClassLoader;

    invoke-static {v4, v9}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v8, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_4e

    .line 23
    :cond_5f
    iget-object v1, v0, Le/a/b/a/b;->b:Ljava/lang/ClassLoader;

    move-object/from16 v2, p7

    invoke-static {v2, v1}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v9

    .line 24
    new-instance v1, Le/a/b/a/e;

    move-object v2, v1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v2 .. v9}, Le/a/b/a/e;-><init>(ILjava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V

    return-object v1
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;
    .registers 17

    move-object v8, p0

    .line 8
    iget-object v0, v8, Le/a/b/a/b;->b:Ljava/lang/ClassLoader;

    move-object v1, p3

    invoke-static {p3, v0}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    .line 9
    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    return-object v0
.end method

.method public a(II)Le/a/a/e/d;
    .registers 5

    .line 25
    new-instance p2, Le/a/b/a/g;

    iget-object v0, p0, Le/a/b/a/b;->a:Ljava/lang/Class;

    iget-object v1, p0, Le/a/b/a/b;->c:Ljava/lang/String;

    invoke-direct {p2, v0, v1, p1}, Le/a/b/a/g;-><init>(Ljava/lang/Class;Ljava/lang/String;I)V

    return-object p2
.end method
