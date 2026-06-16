.class public Lc/a/a/a/n0/e;
.super Ljava/lang/Object;
.source "SnackbarManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/n0/e$c;,
        Lc/a/a/a/n0/e$b;
    }
.end annotation


# static fields
.field public static e:Lc/a/a/a/n0/e;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Landroid/os/Handler;

.field public c:Lc/a/a/a/n0/e$c;

.field public d:Lc/a/a/a/n0/e$c;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lc/a/a/a/n0/e;->a:Ljava/lang/Object;

    .line 3
    new-instance v0, Landroid/os/Handler;

    .line 4
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lc/a/a/a/n0/e$a;

    invoke-direct {v2, p0}, Lc/a/a/a/n0/e$a;-><init>(Lc/a/a/a/n0/e;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lc/a/a/a/n0/e;->b:Landroid/os/Handler;

    return-void
.end method

.method public static a()Lc/a/a/a/n0/e;
    .registers 1

    .line 1
    sget-object v0, Lc/a/a/a/n0/e;->e:Lc/a/a/a/n0/e;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lc/a/a/a/n0/e;

    invoke-direct {v0}, Lc/a/a/a/n0/e;-><init>()V

    sput-object v0, Lc/a/a/a/n0/e;->e:Lc/a/a/a/n0/e;

    .line 3
    :cond_b
    sget-object v0, Lc/a/a/a/n0/e;->e:Lc/a/a/a/n0/e;

    return-object v0
.end method


# virtual methods
.method public a(Lc/a/a/a/n0/e$c;)V
    .registers 4

    .line 8
    iget-object v0, p0, Lc/a/a/a/n0/e;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 9
    :try_start_3
    iget-object v1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    if-eq v1, p1, :cond_b

    iget-object v1, p0, Lc/a/a/a/n0/e;->d:Lc/a/a/a/n0/e$c;

    if-ne v1, p1, :cond_f

    :cond_b
    const/4 v1, 0x2

    .line 10
    invoke-virtual {p0, p1, v1}, Lc/a/a/a/n0/e;->a(Lc/a/a/a/n0/e$c;I)Z

    .line 11
    :cond_f
    monitor-exit v0

    return-void

    :catchall_11
    move-exception p1

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw p1
.end method

.method public final a(Lc/a/a/a/n0/e$b;)Z
    .registers 3

    .line 7
    iget-object v0, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    if-eqz v0, :cond_c

    invoke-virtual {v0, p1}, Lc/a/a/a/n0/e$c;->a(Lc/a/a/a/n0/e$b;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public final a(Lc/a/a/a/n0/e$c;I)Z
    .registers 5

    .line 4
    iget-object v0, p1, Lc/a/a/a/n0/e$c;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/n0/e$b;

    if-eqz v0, :cond_14

    .line 5
    iget-object v1, p0, Lc/a/a/a/n0/e;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 6
    invoke-interface {v0, p2}, Lc/a/a/a/n0/e$b;->a(I)V

    const/4 p1, 0x1

    return p1

    :cond_14
    const/4 p1, 0x0

    return p1
.end method

.method public b(Lc/a/a/a/n0/e$b;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/n0/e;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_3
    invoke-virtual {p0, p1}, Lc/a/a/a/n0/e;->a(Lc/a/a/a/n0/e$b;)Z

    move-result p1

    if-eqz p1, :cond_1b

    iget-object p1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    iget-boolean p1, p1, Lc/a/a/a/n0/e$c;->c:Z

    if-nez p1, :cond_1b

    .line 3
    iget-object p1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    const/4 v1, 0x1

    iput-boolean v1, p1, Lc/a/a/a/n0/e$c;->c:Z

    .line 4
    iget-object p1, p0, Lc/a/a/a/n0/e;->b:Landroid/os/Handler;

    iget-object v1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    :cond_1b
    monitor-exit v0

    return-void

    :catchall_1d
    move-exception p1

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw p1
.end method

.method public final b(Lc/a/a/a/n0/e$c;)V
    .registers 6

    .line 6
    iget v0, p1, Lc/a/a/a/n0/e$c;->b:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    const/16 v1, 0xabe

    if-lez v0, :cond_b

    goto :goto_13

    :cond_b
    const/4 v2, -0x1

    if-ne v0, v2, :cond_11

    const/16 v0, 0x5dc

    goto :goto_13

    :cond_11
    const/16 v0, 0xabe

    .line 7
    :goto_13
    iget-object v1, p0, Lc/a/a/a/n0/e;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    iget-object v1, p0, Lc/a/a/a/n0/e;->b:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v1, v2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    int-to-long v2, v0

    invoke-virtual {v1, p1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method public c(Lc/a/a/a/n0/e$b;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/n0/e;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_3
    invoke-virtual {p0, p1}, Lc/a/a/a/n0/e;->a(Lc/a/a/a/n0/e$b;)Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    iget-boolean p1, p1, Lc/a/a/a/n0/e$c;->c:Z

    if-eqz p1, :cond_19

    .line 3
    iget-object p1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    const/4 v1, 0x0

    iput-boolean v1, p1, Lc/a/a/a/n0/e$c;->c:Z

    .line 4
    iget-object p1, p0, Lc/a/a/a/n0/e;->c:Lc/a/a/a/n0/e$c;

    invoke-virtual {p0, p1}, Lc/a/a/a/n0/e;->b(Lc/a/a/a/n0/e$c;)V

    .line 5
    :cond_19
    monitor-exit v0

    return-void

    :catchall_1b
    move-exception p1

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw p1
.end method
