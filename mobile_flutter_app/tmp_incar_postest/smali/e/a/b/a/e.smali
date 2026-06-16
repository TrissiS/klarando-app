.class public Le/a/b/a/e;
.super Le/a/b/a/a;
.source "MethodSignatureImpl.java"

# interfaces
.implements Le/a/a/e/c;


# instance fields
.field public k:Ljava/lang/Class;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 8

    .line 1
    invoke-direct/range {p0 .. p6}, Le/a/b/a/a;-><init>(ILjava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;)V

    .line 2
    iput-object p7, p0, Le/a/b/a/e;->k:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public a(Le/a/b/a/h;)Ljava/lang/String;
    .registers 5

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2
    invoke-virtual {p0}, Le/a/b/a/f;->e()I

    move-result v1

    invoke-virtual {p1, v1}, Le/a/b/a/h;->a(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3
    iget-boolean v1, p1, Le/a/b/a/h;->b:Z

    if-eqz v1, :cond_1f

    .line 4
    invoke-virtual {p0}, Le/a/b/a/e;->h()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Le/a/b/a/h;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5
    :cond_1f
    iget-boolean v1, p1, Le/a/b/a/h;->b:Z

    if-eqz v1, :cond_28

    const-string v1, " "

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 7
    :cond_28
    invoke-virtual {p0}, Le/a/b/a/f;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Le/a/b/a/f;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Le/a/b/a/h;->a(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "."

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 9
    invoke-virtual {p0}, Le/a/b/a/f;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 10
    invoke-virtual {p0}, Le/a/b/a/a;->g()[Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Le/a/b/a/h;->a(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V

    .line 11
    invoke-virtual {p0}, Le/a/b/a/a;->f()[Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Le/a/b/a/h;->b(Ljava/lang/StringBuffer;[Ljava/lang/Class;)V

    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public h()Ljava/lang/Class;
    .registers 2

    .line 1
    iget-object v0, p0, Le/a/b/a/e;->k:Ljava/lang/Class;

    if-nez v0, :cond_b

    const/4 v0, 0x6

    .line 2
    invoke-virtual {p0, v0}, Le/a/b/a/f;->c(I)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Le/a/b/a/e;->k:Ljava/lang/Class;

    .line 3
    :cond_b
    iget-object v0, p0, Le/a/b/a/e;->k:Ljava/lang/Class;

    return-object v0
.end method
