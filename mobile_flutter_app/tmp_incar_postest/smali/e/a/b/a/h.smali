.class public Le/a/b/a/h;
.super Ljava/lang/Object;
.source "StringMaker.java"


# static fields
.field public static g:Le/a/b/a/h;

.field public static h:Le/a/b/a/h;

.field public static i:Le/a/b/a/h;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Le/a/b/a/h;

    invoke-direct {v0}, Le/a/b/a/h;-><init>()V

    sput-object v0, Le/a/b/a/h;->g:Le/a/b/a/h;

    const/4 v1, 0x1

    .line 2
    iput-boolean v1, v0, Le/a/b/a/h;->a:Z

    const/4 v2, 0x0

    .line 3
    iput-boolean v2, v0, Le/a/b/a/h;->b:Z

    .line 4
    iput-boolean v2, v0, Le/a/b/a/h;->c:Z

    .line 5
    iput-boolean v2, v0, Le/a/b/a/h;->d:Z

    .line 6
    iput-boolean v1, v0, Le/a/b/a/h;->e:Z

    .line 7
    iput v2, v0, Le/a/b/a/h;->f:I

    .line 8
    new-instance v0, Le/a/b/a/h;

    invoke-direct {v0}, Le/a/b/a/h;-><init>()V

    sput-object v0, Le/a/b/a/h;->h:Le/a/b/a/h;

    .line 9
    iput-boolean v1, v0, Le/a/b/a/h;->a:Z

    .line 10
    iput-boolean v1, v0, Le/a/b/a/h;->b:Z

    .line 11
    iput-boolean v2, v0, Le/a/b/a/h;->c:Z

    .line 12
    iput-boolean v2, v0, Le/a/b/a/h;->d:Z

    .line 13
    iput-boolean v2, v0, Le/a/b/a/h;->e:Z

    .line 14
    sget-object v0, Le/a/b/a/h;->g:Le/a/b/a/h;

    iput v1, v0, Le/a/b/a/h;->f:I

    .line 15
    new-instance v0, Le/a/b/a/h;

    invoke-direct {v0}, Le/a/b/a/h;-><init>()V

    sput-object v0, Le/a/b/a/h;->i:Le/a/b/a/h;

    .line 16
    iput-boolean v2, v0, Le/a/b/a/h;->a:Z

    .line 17
    iput-boolean v1, v0, Le/a/b/a/h;->b:Z

    .line 18
    iput-boolean v2, v0, Le/a/b/a/h;->c:Z

    .line 19
    iput-boolean v1, v0, Le/a/b/a/h;->d:Z

    .line 20
    iput-boolean v2, v0, Le/a/b/a/h;->e:Z

    const/4 v1, 0x2

    .line 21
    iput v1, v0, Le/a/b/a/h;->f:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Le/a/b/a/h;->a:Z

    .line 3
    iput-boolean v0, p0, Le/a/b/a/h;->b:Z

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Le/a/b/a/h;->c:Z

    .line 5
    iput-boolean v0, p0, Le/a/b/a/h;->d:Z

    .line 6
    iput-boolean v0, p0, Le/a/b/a/h;->e:Z

    return-void
.end method


# virtual methods
.method public a(I)Ljava/lang/String;
    .registers 4

    .line 3
    iget-boolean v0, p0, Le/a/b/a/h;->d:Z

    const-string v1, ""

    if-nez v0, :cond_7

    return-object v1

    .line 4
    :cond_7
    invoke-static {p1}, Ljava/lang/reflect/Modifier;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_12

    return-object v1

    .line 6
    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4

    .line 12
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Le/a/b/a/h;->a:Z

    invoke-virtual {p0, p1, v0, v1}, Le/a/b/a/h;->a(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 13
    iget-boolean v0, p0, Le/a/b/a/h;->e:Z

    invoke-virtual {p0, p1, p2, v0}, Le/a/b/a/h;->a(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5

    if-nez p1, :cond_5

    const-string p1, "ANONYMOUS"

    return-object p1

    .line 7
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p3}, Le/a/b/a/h;->a(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "[]"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_29
    const/16 p1, 0x2e

    const/16 v0, 0x24

    if-eqz p3, :cond_38

    .line 10
    invoke-virtual {p0, p2}, Le/a/b/a/h;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 11
    :cond_38
    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/16 v0, 0x2d

    .line 1
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    return-object p1

    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V
    .registers 4

    if-nez p2, :cond_3

    return-void

    .line 14
    :cond_3
    iget-boolean v0, p0, Le/a/b/a/h;->b:Z

    if-nez v0, :cond_16

    .line 15
    array-length p2, p2

    if-nez p2, :cond_10

    const-string p2, "()"

    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    return-void

    :cond_10
    const-string p2, "(..)"

    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    return-void

    :cond_16
    const-string v0, "("

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 19
    invoke-virtual {p0, p1, p2}, Le/a/b/a/h;->c(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V

    const-string p2, ")"

    .line 20
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    return-void
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/16 v0, 0x2e

    .line 1
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    return-object p1

    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V
    .registers 4

    .line 3
    iget-boolean v0, p0, Le/a/b/a/h;->c:Z

    if-eqz v0, :cond_12

    if-eqz p2, :cond_12

    array-length v0, p2

    if-nez v0, :cond_a

    goto :goto_12

    :cond_a
    const-string v0, " throws "

    .line 4
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5
    invoke-virtual {p0, p1, p2}, Le/a/b/a/h;->c(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V

    :cond_12
    :goto_12
    return-void
.end method

.method public c(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V
    .registers 5

    const/4 v0, 0x0

    .line 1
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_17

    if-lez v0, :cond_b

    const-string v1, ", "

    .line 2
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3
    :cond_b
    aget-object v1, p2, v0

    invoke-virtual {p0, v1}, Le/a/b/a/h;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    return-void
.end method
