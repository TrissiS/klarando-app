.class public Lb/l/d/b$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DefaultSpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Z

.field public final synthetic d:Lb/l/d/w$e;

.field public final synthetic e:Lb/l/d/b$k;


# direct methods
.method public constructor <init>(Lb/l/d/b;Landroid/view/ViewGroup;Landroid/view/View;ZLb/l/d/w$e;Lb/l/d/b$k;)V
    .registers 7

    .line 1
    iput-object p2, p0, Lb/l/d/b$c;->a:Landroid/view/ViewGroup;

    iput-object p3, p0, Lb/l/d/b$c;->b:Landroid/view/View;

    iput-boolean p4, p0, Lb/l/d/b$c;->c:Z

    iput-object p5, p0, Lb/l/d/b$c;->d:Lb/l/d/w$e;

    iput-object p6, p0, Lb/l/d/b$c;->e:Lb/l/d/b$k;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/l/d/b$c;->a:Landroid/view/ViewGroup;

    iget-object v0, p0, Lb/l/d/b$c;->b:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 2
    iget-boolean p1, p0, Lb/l/d/b$c;->c:Z

    if-eqz p1, :cond_16

    .line 3
    iget-object p1, p0, Lb/l/d/b$c;->d:Lb/l/d/w$e;

    invoke-virtual {p1}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object p1

    iget-object v0, p0, Lb/l/d/b$c;->b:Landroid/view/View;

    invoke-virtual {p1, v0}, Lb/l/d/w$e$c;->applyState(Landroid/view/View;)V

    .line 4
    :cond_16
    iget-object p1, p0, Lb/l/d/b$c;->e:Lb/l/d/b$k;

    invoke-virtual {p1}, Lb/l/d/b$l;->a()V

    return-void
.end method
