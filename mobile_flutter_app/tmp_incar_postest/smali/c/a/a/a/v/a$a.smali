.class public final Lc/a/a/a/v/a$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CircularRevealCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/v/a;->a(Lc/a/a/a/v/c;)Landroid/animation/Animator$AnimatorListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/v/c;


# direct methods
.method public constructor <init>(Lc/a/a/a/v/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/v/a$a;->a:Lc/a/a/a/v/c;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 2

    .line 1
    iget-object p1, p0, Lc/a/a/a/v/a$a;->a:Lc/a/a/a/v/c;

    invoke-interface {p1}, Lc/a/a/a/v/c;->b()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    .line 1
    iget-object p1, p0, Lc/a/a/a/v/a$a;->a:Lc/a/a/a/v/c;

    invoke-interface {p1}, Lc/a/a/a/v/c;->a()V

    return-void
.end method
