.class public abstract Le/a/b/a/f;
.super Ljava/lang/Object;
.source "SignatureImpl.java"

# interfaces
.implements Le/a/a/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/a/b/a/f$b;,
        Le/a/b/a/f$a;
    }
.end annotation


# static fields
.field public static h:Z = true


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/Class;

.field public e:Le/a/b/a/f$a;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/ClassLoader;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Class;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Le/a/b/a/f;->a:I

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Le/a/b/a/f;->g:Ljava/lang/ClassLoader;

    .line 4
    iput p1, p0, Le/a/b/a/f;->a:I

    .line 5
    iput-object p2, p0, Le/a/b/a/f;->b:Ljava/lang/String;

    .line 6
    iput-object p3, p0, Le/a/b/a/f;->d:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public a(I)I
    .registers 3

    .line 3
    invoke-virtual {p0, p1}, Le/a/b/a/f;->b(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x10

    .line 4
    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public a()Ljava/lang/Class;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/f;->d:Ljava/lang/Class;

    if-nez v0, :cond_b

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Le/a/b/a/f;->c(I)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/f;->d:Ljava/lang/Class;

    .line 2
    :cond_b
    iget-object v0, p0, Le/a/b/a/f;->d:Ljava/lang/Class;

    return-object v0
.end method

.method public abstract a(Le/a/b/a/h;)Ljava/lang/String;
.end method

.method public b()Ljava/lang/String;
    .registers 2

    .line 9
    iget-object v0, p0, Le/a/b/a/f;->b:Ljava/lang/String;

    if-nez v0, :cond_b

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/a/b/a/f;->b(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/f;->b:Ljava/lang/String;

    .line 10
    :cond_b
    iget-object v0, p0, Le/a/b/a/f;->b:Ljava/lang/String;

    return-object v0
.end method

.method public b(I)Ljava/lang/String;
    .registers 6

    .line 11
    iget-object v0, p0, Le/a/b/a/f;->f:Ljava/lang/String;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v2, 0x0

    :goto_9
    add-int/lit8 v3, p1, -0x1

    if-lez p1, :cond_17

    add-int/lit8 v2, v0, 0x1

    .line 12
    iget-object p1, p0, Le/a/b/a/f;->f:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    move p1, v3

    goto :goto_9

    :cond_17
    const/4 p1, -0x1

    if-ne v0, p1, :cond_20

    .line 13
    iget-object p1, p0, Le/a/b/a/f;->f:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 14
    :cond_20
    iget-object p1, p0, Le/a/b/a/f;->f:Ljava/lang/String;

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b(Le/a/b/a/h;)Ljava/lang/String;
    .registers 4

    .line 1
    sget-boolean v0, Le/a/b/a/f;->h:Z

    if-eqz v0, :cond_1b

    .line 2
    iget-object v0, p0, Le/a/b/a/f;->e:Le/a/b/a/f$a;

    if-nez v0, :cond_14

    .line 3
    :try_start_8
    new-instance v0, Le/a/b/a/f$b;

    invoke-direct {v0}, Le/a/b/a/f$b;-><init>()V

    iput-object v0, p0, Le/a/b/a/f;->e:Le/a/b/a/f$a;
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    goto :goto_1b

    :catchall_10
    const/4 v0, 0x0

    .line 4
    sput-boolean v0, Le/a/b/a/f;->h:Z

    goto :goto_1b

    .line 5
    :cond_14
    iget v1, p1, Le/a/b/a/h;->f:I

    invoke-interface {v0, v1}, Le/a/b/a/f$a;->a(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1c

    :cond_1b
    :goto_1b
    const/4 v0, 0x0

    :goto_1c
    if-nez v0, :cond_22

    .line 6
    invoke-virtual {p0, p1}, Le/a/b/a/f;->a(Le/a/b/a/h;)Ljava/lang/String;

    move-result-object v0

    .line 7
    :cond_22
    sget-boolean v1, Le/a/b/a/f;->h:Z

    if-eqz v1, :cond_2d

    .line 8
    iget-object v1, p0, Le/a/b/a/f;->e:Le/a/b/a/f$a;

    iget p1, p1, Le/a/b/a/h;->f:I

    invoke-interface {v1, p1, v0}, Le/a/b/a/f$a;->a(ILjava/lang/String;)V

    :cond_2d
    return-object v0
.end method

.method public c(I)Ljava/lang/Class;
    .registers 3

    .line 4
    invoke-virtual {p0, p1}, Le/a/b/a/f;->b(I)Ljava/lang/String;

    move-result-object p1

    .line 5
    invoke-virtual {p0}, Le/a/b/a/f;->d()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p1, v0}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method public c()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/f;->c:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 2
    invoke-virtual {p0}, Le/a/b/a/f;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/f;->c:Ljava/lang/String;

    .line 3
    :cond_e
    iget-object v0, p0, Le/a/b/a/f;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Ljava/lang/ClassLoader;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/f;->g:Ljava/lang/ClassLoader;

    if-nez v0, :cond_e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/f;->g:Ljava/lang/ClassLoader;

    .line 2
    :cond_e
    iget-object v0, p0, Le/a/b/a/f;->g:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public d(I)[Ljava/lang/Class;
    .registers 7

    .line 3
    invoke-virtual {p0, p1}, Le/a/b/a/f;->b(I)Ljava/lang/String;

    move-result-object p1

    .line 4
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, ":"

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result p1

    .line 6
    new-array v1, p1, [Ljava/lang/Class;

    const/4 v2, 0x0

    :goto_12
    if-ge v2, p1, :cond_25

    .line 7
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Le/a/b/a/f;->d()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-static {v3, v4}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_25
    return-object v1
.end method

.method public e()I
    .registers 3

    .line 1
    iget v0, p0, Le/a/b/a/f;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/a/b/a/f;->a(I)I

    move-result v0

    iput v0, p0, Le/a/b/a/f;->a:I

    .line 2
    :cond_c
    iget v0, p0, Le/a/b/a/f;->a:I

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .line 1
    sget-object v0, Le/a/b/a/h;->h:Le/a/b/a/h;

    invoke-virtual {p0, v0}, Le/a/b/a/f;->b(Le/a/b/a/h;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
