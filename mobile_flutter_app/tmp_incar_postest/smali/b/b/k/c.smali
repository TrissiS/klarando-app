.class public abstract Lb/b/k/c;
.super Ljava/lang/Object;
.source "AppCompatDelegate.java"


# static fields
.field public static h:I = -0x64

.field public static final i:Lb/e/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/b<",
            "Ljava/lang/ref/WeakReference<",
            "Lb/b/k/c;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final j:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/e/b;

    invoke-direct {v0}, Lb/e/b;-><init>()V

    sput-object v0, Lb/b/k/c;->i:Lb/e/b;

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb/b/k/c;->j:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;Lb/b/k/b;)Lb/b/k/c;
    .registers 3

    .line 1
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;-><init>(Landroid/app/Activity;Lb/b/k/b;)V

    return-object v0
.end method

.method public static a(Landroid/app/Dialog;Lb/b/k/b;)Lb/b/k/c;
    .registers 3

    .line 2
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;-><init>(Landroid/app/Dialog;Lb/b/k/b;)V

    return-object v0
.end method

.method public static a(Lb/b/k/c;)V
    .registers 4

    .line 3
    sget-object v0, Lb/b/k/c;->j:Ljava/lang/Object;

    monitor-enter v0

    .line 4
    :try_start_3
    invoke-static {p0}, Lb/b/k/c;->c(Lb/b/k/c;)V

    .line 5
    sget-object v1, Lb/b/k/c;->i:Lb/e/b;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lb/e/b;->add(Ljava/lang/Object;)Z

    .line 6
    monitor-exit v0

    return-void

    :catchall_12
    move-exception p0

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw p0
.end method

.method public static b(Lb/b/k/c;)V
    .registers 2

    .line 2
    sget-object v0, Lb/b/k/c;->j:Ljava/lang/Object;

    monitor-enter v0

    .line 3
    :try_start_3
    invoke-static {p0}, Lb/b/k/c;->c(Lb/b/k/c;)V

    .line 4
    monitor-exit v0

    return-void

    :catchall_8
    move-exception p0

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw p0
.end method

.method public static c(Lb/b/k/c;)V
    .registers 4

    .line 1
    sget-object v0, Lb/b/k/c;->j:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_3
    sget-object v1, Lb/b/k/c;->i:Lb/e/b;

    invoke-virtual {v1}, Lb/e/b;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 3
    :cond_9
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/k/c;

    if-eq v2, p0, :cond_1f

    if-nez v2, :cond_9

    .line 5
    :cond_1f
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_9

    .line 6
    :cond_23
    monitor-exit v0

    return-void

    :catchall_25
    move-exception p0

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw p0
.end method

.method public static j()I
    .registers 1

    .line 1
    sget v0, Lb/b/k/c;->h:I

    return v0
.end method


# virtual methods
.method public a()I
    .registers 2

    const/16 v0, -0x64

    return v0
.end method

.method public abstract a(I)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation
.end method

.method public a(Landroid/content/Context;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public abstract a(Landroid/content/res/Configuration;)V
.end method

.method public abstract a(Landroid/os/Bundle;)V
.end method

.method public abstract a(Landroid/view/View;)V
.end method

.method public abstract a(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public abstract a(Ljava/lang/CharSequence;)V
.end method

.method public b(Landroid/content/Context;)Landroid/content/Context;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/b/k/c;->a(Landroid/content/Context;)V

    return-object p1
.end method

.method public abstract b()Landroid/view/MenuInflater;
.end method

.method public abstract b(Landroid/os/Bundle;)V
.end method

.method public abstract b(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public abstract b(I)Z
.end method

.method public abstract c()Landroidx/appcompat/app/ActionBar;
.end method

.method public abstract c(I)V
.end method

.method public abstract c(Landroid/os/Bundle;)V
.end method

.method public abstract d()V
.end method

.method public d(I)V
    .registers 2

    return-void
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public abstract g()V
.end method

.method public abstract h()V
.end method

.method public abstract i()V
.end method
