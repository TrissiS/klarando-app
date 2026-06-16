.class public Ld/a/b/f/b/a;
.super Ld/a/a/d$b;
.source "CommonDialog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Ld/a/b/f/b/a<",
        "*>;>",
        "Ld/a/a/d$b<",
        "TB;>;"
    }
.end annotation


# instance fields
.field public C:Z

.field public final D:Landroid/view/ViewGroup;

.field public final E:Landroid/widget/TextView;

.field public final F:Landroid/widget/TextView;

.field public final G:Landroid/view/View;

.field public final H:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$b;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ld/a/b/f/b/a;->C:Z

    const v0, 0x7f0b0034

    .line 3
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->c(I)Ld/a/a/d$b;

    .line 4
    sget v0, Ld/a/a/g/c;->b:I

    invoke-virtual {p0, v0}, Ld/a/a/d$b;->b(I)Ld/a/a/d$b;

    const/16 v0, 0x11

    .line 5
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->d(I)Ld/a/a/d$b;

    const v0, 0x7f0800ea

    .line 6
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Ld/a/b/f/b/a;->D:Landroid/view/ViewGroup;

    const v0, 0x7f0801ea

    .line 7
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Ld/a/b/f/b/a;->E:Landroid/widget/TextView;

    const v0, 0x7f0801e8

    .line 8
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Ld/a/b/f/b/a;->F:Landroid/widget/TextView;

    const v0, 0x7f080201

    .line 9
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/f/b/a;->G:Landroid/view/View;

    const v0, 0x7f0801e9

    .line 10
    invoke-virtual {p0, v0}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Ld/a/b/f/b/a;->H:Landroid/widget/TextView;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/view/View;

    .line 11
    iget-object v2, p0, Ld/a/b/f/b/a;->F:Landroid/widget/TextView;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    aput-object v0, v1, p1

    invoke-interface {p0, v1}, Ld/a/a/g/e;->a([Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/a;->F:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Ld/a/b/f/b/a;->G:Landroid/view/View;

    if-eqz p1, :cond_18

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_16

    goto :goto_18

    :cond_16
    const/4 p1, 0x0

    goto :goto_1a

    :cond_18
    :goto_18
    const/16 p1, 0x8

    :goto_1a
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-object p0
.end method

.method public b(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/a;->H:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public c(Landroid/view/View;)Ld/a/b/f/b/a;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/a;->D:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-object p0
.end method

.method public c(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TB;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Ld/a/b/f/b/a;->E:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public g(I)Ld/a/b/f/b/a;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->a(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    return-object p0
.end method

.method public h(I)Ld/a/b/f/b/a;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->b(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    return-object p0
.end method

.method public i(I)Ld/a/b/f/b/a;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ld/a/a/d$b;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/f/b/a;->D:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->c(Landroid/view/View;)Ld/a/b/f/b/a;

    return-object p0
.end method

.method public i()V
    .registers 2

    .line 2
    iget-boolean v0, p0, Ld/a/b/f/b/a;->C:Z

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {p0}, Ld/a/a/d$b;->b()V

    :cond_7
    return-void
.end method

.method public j(I)Ld/a/b/f/b/a;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->c(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    return-object p0
.end method
