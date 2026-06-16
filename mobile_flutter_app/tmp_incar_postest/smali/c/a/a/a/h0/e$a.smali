.class public Lc/a/a/a/h0/e$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CircularIndeterminateAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/e;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/e;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/e;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/e$a;->a:Lc/a/a/a/h0/e;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/e$a;->a:Lc/a/a/a/h0/e;

    .line 3
    invoke-static {p1}, Lc/a/a/a/h0/e;->a(Lc/a/a/a/h0/e;)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lc/a/a/a/h0/e$a;->a:Lc/a/a/a/h0/e;

    invoke-static {v1}, Lc/a/a/a/h0/e;->b(Lc/a/a/a/h0/e;)Lc/a/a/a/h0/c;

    move-result-object v1

    iget-object v1, v1, Lc/a/a/a/h0/c;->c:[I

    array-length v1, v1

    rem-int/2addr v0, v1

    .line 4
    invoke-static {p1, v0}, Lc/a/a/a/h0/e;->a(Lc/a/a/a/h0/e;I)I

    return-void
.end method
