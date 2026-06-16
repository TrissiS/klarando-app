.class public abstract Ld/a/b/g/l/c/h;
.super Ljava/lang/Object;
.source "FileCreator.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a(Ld/a/b/g/l/f/b;)Ljava/io/File;
.end method

.method public final a(Ld/a/b/g/l/f/b;Ld/a/b/g/l/a;)Ljava/io/File;
    .registers 10

    .line 1
    invoke-virtual {p2}, Ld/a/b/g/l/a;->q()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/h;->b(Ld/a/b/g/l/f/b;)Ljava/io/File;

    move-result-object p1

    goto :goto_f

    .line 3
    :cond_b
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/h;->a(Ld/a/b/g/l/f/b;)Ljava/io/File;

    move-result-object p1

    .line 4
    :goto_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Daemon"

    const-string v2, "Normal"

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-nez p1, :cond_3a

    .line 5
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v4

    .line 6
    invoke-virtual {p2}, Ld/a/b/g/l/a;->q()Z

    move-result p2

    if-eqz p2, :cond_2d

    goto :goto_2e

    :cond_2d
    move-object v1, v2

    :goto_2e
    aput-object v1, v5, v3

    const-string p2, "Could not returns a null file with FileCreator:[%s], create mode is [%s]"

    .line 7
    invoke-static {p2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_3a
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_5a

    .line 9
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v4

    .line 10
    invoke-virtual {p2}, Ld/a/b/g/l/a;->q()Z

    move-result p2

    if-eqz p2, :cond_4d

    goto :goto_4e

    :cond_4d
    move-object v1, v2

    :goto_4e
    aput-object v1, v5, v3

    const-string p2, "Could not returns a directory file with FileCreator:[%s], create mode is [%s]"

    .line 11
    invoke-static {p2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5a
    return-object p1
.end method

.method public abstract b(Ld/a/b/g/l/f/b;)Ljava/io/File;
.end method
