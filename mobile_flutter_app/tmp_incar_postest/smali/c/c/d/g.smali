.class public final Lc/c/d/g;
.super Ljava/lang/Object;
.source "ToastImpl.java"


# static fields
.field public static final g:Landroid/os/Handler;


# instance fields
.field public final a:Lc/c/d/k/b;

.field public final b:Lc/c/d/j;

.field public final c:Ljava/lang/String;

.field public d:Z

.field public final e:Ljava/lang/Runnable;

.field public final f:Ljava/lang/Runnable;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lc/c/d/k/b;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lc/c/d/g$a;

    invoke-direct {v0, p0}, Lc/c/d/g$a;-><init>(Lc/c/d/g;)V

    iput-object v0, p0, Lc/c/d/g;->e:Ljava/lang/Runnable;

    .line 3
    new-instance v0, Lc/c/d/g$b;

    invoke-direct {v0, p0}, Lc/c/d/g$b;-><init>(Lc/c/d/g;)V

    iput-object v0, p0, Lc/c/d/g;->f:Ljava/lang/Runnable;

    .line 4
    iput-object p2, p0, Lc/c/d/g;->a:Lc/c/d/k/b;

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lc/c/d/g;->c:Ljava/lang/String;

    .line 6
    new-instance p2, Lc/c/d/j;

    invoke-direct {p2, p1}, Lc/c/d/j;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lc/c/d/g;->b:Lc/c/d/j;

    return-void
.end method

.method public static synthetic a(Lc/c/d/g;)Lc/c/d/j;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/c/d/g;->b:Lc/c/d/j;

    return-object p0
.end method

.method public static synthetic b(Lc/c/d/g;)Ljava/lang/String;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/c/d/g;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic c(Lc/c/d/g;)Lc/c/d/k/b;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/c/d/g;->a:Lc/c/d/k/b;

    return-object p0
.end method

.method public static synthetic d()Landroid/os/Handler;
    .registers 1

    .line 1
    sget-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 3
    invoke-virtual {p0}, Lc/c/d/g;->b()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 4
    :cond_7
    sget-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    iget-object v1, p0, Lc/c/d/g;->f:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 5
    sget-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    iget-object v1, p0, Lc/c/d/g;->f:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 2
    iput-boolean p1, p0, Lc/c/d/g;->d:Z

    return-void
.end method

.method public b()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Lc/c/d/g;->d:Z

    return v0
.end method

.method public c()V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lc/c/d/g;->b()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 3
    :cond_7
    sget-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    iget-object v1, p0, Lc/c/d/g;->e:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4
    sget-object v0, Lc/c/d/g;->g:Landroid/os/Handler;

    iget-object v1, p0, Lc/c/d/g;->e:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
