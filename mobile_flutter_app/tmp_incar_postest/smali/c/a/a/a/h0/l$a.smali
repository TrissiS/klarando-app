.class public Lc/a/a/a/h0/l$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LinearIndeterminateContiguousAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/l;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/l;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/l;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/l$a;->a:Lc/a/a/a/h0/l;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/l$a;->a:Lc/a/a/a/h0/l;

    .line 3
    invoke-static {p1}, Lc/a/a/a/h0/l;->a(Lc/a/a/a/h0/l;)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lc/a/a/a/h0/l$a;->a:Lc/a/a/a/h0/l;

    invoke-static {v2}, Lc/a/a/a/h0/l;->b(Lc/a/a/a/h0/l;)Lc/a/a/a/h0/c;

    move-result-object v2

    iget-object v2, v2, Lc/a/a/a/h0/c;->c:[I

    array-length v2, v2

    rem-int/2addr v0, v2

    .line 4
    invoke-static {p1, v0}, Lc/a/a/a/h0/l;->a(Lc/a/a/a/h0/l;I)I

    .line 5
    iget-object p1, p0, Lc/a/a/a/h0/l$a;->a:Lc/a/a/a/h0/l;

    invoke-static {p1, v1}, Lc/a/a/a/h0/l;->a(Lc/a/a/a/h0/l;Z)Z

    return-void
.end method
