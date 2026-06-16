.class public Lb/l/d/d$b$a;
.super Ljava/lang/Object;
.source "FragmentAnim.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/d$b;->onAnimationEnd(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/d$b;


# direct methods
.method public constructor <init>(Lb/l/d/d$b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/l/d/d$b$a;->h:Lb/l/d/d$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/d$b$a;->h:Lb/l/d/d$b;

    iget-object v0, v0, Lb/l/d/d$b;->b:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->l()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 2
    iget-object v0, p0, Lb/l/d/d$b$a;->h:Lb/l/d/d$b;

    iget-object v0, v0, Lb/l/d/d$b;->b:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->a(Landroid/view/View;)V

    .line 3
    iget-object v0, p0, Lb/l/d/d$b$a;->h:Lb/l/d/d$b;

    iget-object v1, v0, Lb/l/d/d$b;->c:Lb/l/d/r$g;

    iget-object v2, v0, Lb/l/d/d$b;->b:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Lb/l/d/d$b;->d:Lb/h/i/b;

    invoke-interface {v1, v2, v0}, Lb/l/d/r$g;->a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    :cond_1d
    return-void
.end method
