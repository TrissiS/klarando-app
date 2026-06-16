.class public Lb/h/m/c0$b;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompat.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/m/c0;->a(Lb/h/m/f0;)Lb/h/m/c0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/h/m/f0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public constructor <init>(Lb/h/m/c0;Lb/h/m/f0;Landroid/view/View;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lb/h/m/c0$b;->a:Lb/h/m/f0;

    iput-object p3, p0, Lb/h/m/c0$b;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/h/m/c0$b;->a:Lb/h/m/f0;

    iget-object v0, p0, Lb/h/m/c0$b;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/h/m/f0;->a(Landroid/view/View;)V

    return-void
.end method
