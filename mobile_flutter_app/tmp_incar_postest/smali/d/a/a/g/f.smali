.class public final synthetic Ld/a/a/g/f;
.super Ljava/lang/Object;
.source "HandlerAction.java"


# direct methods
.method public static a(Ld/a/a/g/g;)V
    .registers 2
    .param p0, "_this"    # Ld/a/a/g/g;

    .line 3
    sget-object v0, Ld/a/a/g/g;->g:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public static a(Ld/a/a/g/g;Ljava/lang/Runnable;)Z
    .registers 4
    .param p0, "_this"    # Ld/a/a/g/g;

    const-wide/16 v0, 0x0

    .line 1
    invoke-interface {p0, p1, v0, v1}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public static a(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z
    .registers 5
    .param p0, "_this"    # Ld/a/a/g/g;

    .line 2
    sget-object v0, Ld/a/a/g/g;->g:Landroid/os/Handler;

    invoke-virtual {v0, p1, p0, p2, p3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    move-result p1

    return p1
.end method

.method public static b(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z
    .registers 7
    .param p0, "_this"    # Ld/a/a/g/g;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-gez v2, :cond_7

    move-wide p2, v0

    .line 1
    :cond_7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-interface {p0, p1, v0, v1}, Ld/a/a/g/g;->b(Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method
