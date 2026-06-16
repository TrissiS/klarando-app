.class public abstract Ld/a/b/g/l/c/c;
.super Ljava/lang/Object;
.source "CheckWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public h:Ld/a/b/g/l/d/b;

.field public i:Ld/a/b/g/l/a;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/c/c;)Ld/a/b/g/l/d/b;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/c/c;->h:Ld/a/b/g/l/d/b;

    return-object p0
.end method


# virtual methods
.method public final a(Ld/a/b/g/l/f/b;)Ld/a/b/g/l/f/b;
    .registers 5

    .line 18
    invoke-virtual {p1}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Ld/a/b/g/l/f/b;->b(Z)V

    .line 20
    iget-object v0, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    new-instance v1, Ld/a/b/g/l/e/j;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->p()Ld/a/b/g/l/c/n;

    move-result-object v2

    invoke-direct {v1, v2}, Ld/a/b/g/l/e/j;-><init>(Ld/a/b/g/l/c/n;)V

    invoke-virtual {v0, v1}, Ld/a/b/g/l/a;->a(Ld/a/b/g/l/c/n;)Ld/a/b/g/l/a;

    :cond_18
    return-object p1
.end method

.method public final a()V
    .registers 3

    .line 16
    iget-object v0, p0, Ld/a/b/g/l/c/c;->h:Ld/a/b/g/l/d/b;

    if-nez v0, :cond_5

    return-void

    .line 17
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/c$b;

    invoke-direct {v1, p0}, Ld/a/b/g/l/c/c$b;-><init>(Ld/a/b/g/l/c/c;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    return-void
.end method

.method public final a(Ld/a/b/g/l/d/b;)V
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/c/c;->h:Ld/a/b/g/l/d/b;

    return-void
.end method

.method public a(Ld/a/b/g/l/f/a;)V
    .registers 3

    .line 4
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "You must implements this method for async request"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Ljava/lang/String;)V
    .registers 6

    .line 5
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->o()Ld/a/b/g/l/c/m;

    move-result-object v0

    .line 6
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/m;->a(Ljava/lang/String;)Ld/a/b/g/l/f/b;

    move-result-object p1

    if-eqz p1, :cond_23

    .line 7
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/f/b;)Ld/a/b/g/l/f/b;

    .line 8
    iget-object v0, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->n()Ld/a/b/g/l/c/l;

    move-result-object v0

    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/l;->a(Ld/a/b/g/l/f/b;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 9
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/c;->b(Ld/a/b/g/l/f/b;)V

    goto :goto_41

    .line 10
    :cond_1f
    invoke-virtual {p0}, Ld/a/b/g/l/c/c;->a()V

    goto :goto_41

    .line 11
    :cond_23
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not returns null by %s.parse()"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    .line 13
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3d
    .catchall {:try_start_0 .. :try_end_3d} :catchall_3d

    :catchall_3d
    move-exception p1

    .line 14
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/c;->a(Ljava/lang/Throwable;)V

    :goto_41
    return-void
.end method

.method public final a(Ljava/lang/Throwable;)V
    .registers 2

    .line 15
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/c;->b(Ljava/lang/Throwable;)V

    return-void
.end method

.method public b(Ld/a/b/g/l/f/a;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "You must implements this method for sync request"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final b(Ld/a/b/g/l/f/b;)V
    .registers 4

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/c/c;->h:Ld/a/b/g/l/d/b;

    if-nez v0, :cond_5

    return-void

    .line 3
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/c$a;

    invoke-direct {v1, p0, p1}, Ld/a/b/g/l/c/c$a;-><init>(Ld/a/b/g/l/c/c;Ld/a/b/g/l/f/b;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final b(Ljava/lang/Throwable;)V
    .registers 4

    .line 4
    iget-object v0, p0, Ld/a/b/g/l/c/c;->h:Ld/a/b/g/l/d/b;

    if-nez v0, :cond_5

    return-void

    .line 5
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/c$c;

    invoke-direct {v1, p0, p1}, Ld/a/b/g/l/c/c$c;-><init>(Ld/a/b/g/l/c/c;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public b()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final run()V
    .registers 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ld/a/b/g/l/c/c;->b()Z

    move-result v0

    if-nez v0, :cond_14

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->c()Ld/a/b/g/l/f/a;

    move-result-object v0

    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/c;->b(Ld/a/b/g/l/f/a;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/c;->a(Ljava/lang/String;)V

    goto :goto_23

    .line 3
    :cond_14
    iget-object v0, p0, Ld/a/b/g/l/c/c;->i:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->c()Ld/a/b/g/l/f/a;

    move-result-object v0

    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/f/a;)V
    :try_end_1d
    .catchall {:try_start_0 .. :try_end_1d} :catchall_1f

    const/4 v0, 0x0

    throw v0

    :catchall_1f
    move-exception v0

    .line 4
    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/c;->a(Ljava/lang/Throwable;)V

    :goto_23
    return-void
.end method
