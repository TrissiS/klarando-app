.class public Lc/a/a/a/p0/f$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "IndicatorViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/f;->a(IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:I

.field public final synthetic d:Landroid/widget/TextView;

.field public final synthetic e:Lc/a/a/a/p0/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/f;ILandroid/widget/TextView;ILandroid/widget/TextView;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/f$a;->e:Lc/a/a/a/p0/f;

    iput p2, p0, Lc/a/a/a/p0/f$a;->a:I

    iput-object p3, p0, Lc/a/a/a/p0/f$a;->b:Landroid/widget/TextView;

    iput p4, p0, Lc/a/a/a/p0/f$a;->c:I

    iput-object p5, p0, Lc/a/a/a/p0/f$a;->d:Landroid/widget/TextView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->e:Lc/a/a/a/p0/f;

    iget v0, p0, Lc/a/a/a/p0/f$a;->a:I

    invoke-static {p1, v0}, Lc/a/a/a/p0/f;->a(Lc/a/a/a/p0/f;I)I

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->e:Lc/a/a/a/p0/f;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lc/a/a/a/p0/f;->a(Lc/a/a/a/p0/f;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 3
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->b:Landroid/widget/TextView;

    if-eqz p1, :cond_2b

    const/4 v1, 0x4

    .line 4
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 5
    iget p1, p0, Lc/a/a/a/p0/f$a;->c:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2b

    iget-object p1, p0, Lc/a/a/a/p0/f$a;->e:Lc/a/a/a/p0/f;

    invoke-static {p1}, Lc/a/a/a/p0/f;->a(Lc/a/a/a/p0/f;)Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_2b

    .line 6
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->e:Lc/a/a/a/p0/f;

    invoke-static {p1}, Lc/a/a/a/p0/f;->a(Lc/a/a/a/p0/f;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    :cond_2b
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->d:Landroid/widget/TextView;

    if-eqz p1, :cond_3a

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 9
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->d:Landroid/widget/TextView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    :cond_3a
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/f$a;->d:Landroid/widget/TextView;

    if-eqz p1, :cond_8

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_8
    return-void
.end method
