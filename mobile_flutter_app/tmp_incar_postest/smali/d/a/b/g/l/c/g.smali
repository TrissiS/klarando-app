.class public abstract Ld/a/b/g/l/c/g;
.super Ljava/lang/Object;
.source "FileChecker.java"


# instance fields
.field public a:Ld/a/b/g/l/f/b;

.field public b:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ld/a/b/g/l/f/b;Ljava/io/File;)V
    .registers 3

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    .line 2
    iput-object p2, p0, Ld/a/b/g/l/c/g;->b:Ljava/io/File;

    return-void
.end method

.method public final a()Z
    .registers 3

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/c/g;->b:Ljava/io/File;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_15

    .line 4
    :cond_c
    :try_start_c
    invoke-virtual {p0}, Ld/a/b/g/l/c/g;->b()Z

    move-result v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_10} :catch_11

    return v0

    :catch_11
    move-exception v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_15
    :goto_15
    return v1
.end method

.method public abstract b()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract c()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
