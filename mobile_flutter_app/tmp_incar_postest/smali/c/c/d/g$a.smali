.class public Lc/c/d/g$a;
.super Ljava/lang/Object;
.source "ToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/c/d/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/c/d/g;


# direct methods
.method public constructor <init>(Lc/c/d/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-virtual {v0}, Lc/c/d/g;->a()V

    return-void
.end method

.method public run()V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v0}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v0

    invoke-virtual {v0}, Lc/c/d/j;->a()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_c8

    .line 2
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_14

    goto/16 :goto_c8

    .line 3
    :cond_14
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_21

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_21

    return-void

    .line 4
    :cond_21
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    const/4 v2, -0x2

    .line 5
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 6
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v2, -0x3

    .line 7
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->format:I

    const v2, 0x1030004

    .line 8
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    const/16 v2, 0x98

    .line 9
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 10
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->b(Lc/c/d/g;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 11
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getGravity()I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 12
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getXOffset()I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 13
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getYOffset()I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 14
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getVerticalMargin()F

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    .line 15
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getHorizontalMargin()F

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    const-string v2, "window"

    .line 16
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    if-nez v0, :cond_86

    return-void

    .line 17
    :cond_86
    :try_start_86
    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getView()Landroid/view/View;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    invoke-static {}, Lc/c/d/g;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lc/c/d/a;

    invoke-direct {v1, p0}, Lc/c/d/a;-><init>(Lc/c/d/g$a;)V

    iget-object v2, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v2}, Lc/c/d/g;->c(Lc/c/d/g;)Lc/c/d/k/b;

    move-result-object v2

    invoke-interface {v2}, Lc/c/d/k/b;->getDuration()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_ac

    const-wide/16 v4, 0xdac

    goto :goto_ae

    :cond_ac
    const-wide/16 v4, 0x7d0

    :goto_ae
    invoke-virtual {v0, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 19
    iget-object v0, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-static {v0}, Lc/c/d/g;->a(Lc/c/d/g;)Lc/c/d/j;

    move-result-object v0

    iget-object v1, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-virtual {v0, v1}, Lc/c/d/j;->a(Lc/c/d/g;)V

    .line 20
    iget-object v0, p0, Lc/c/d/g$a;->h:Lc/c/d/g;

    invoke-virtual {v0, v3}, Lc/c/d/g;->a(Z)V
    :try_end_c1
    .catch Ljava/lang/IllegalStateException; {:try_start_86 .. :try_end_c1} :catch_c4
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_86 .. :try_end_c1} :catch_c2

    goto :goto_c8

    :catch_c2
    move-exception v0

    goto :goto_c5

    :catch_c4
    move-exception v0

    .line 21
    :goto_c5
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    :cond_c8
    :goto_c8
    return-void
.end method
