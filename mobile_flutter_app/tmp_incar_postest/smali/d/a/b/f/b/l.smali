.class public final Ld/a/b/f/b/l;
.super Ld/a/a/d$b;
.source "WaitDialog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/a/d$b<",
        "Ld/a/b/f/b/l;",
        ">;"
    }
.end annotation


# instance fields
.field public final C:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$b;-><init>(Landroid/content/Context;)V

    const p1, 0x7f0b003d

    .line 2
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->c(I)Ld/a/a/d$b;

    const p1, 0x1030004

    .line 3
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->b(I)Ld/a/a/d$b;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->a(Z)Ld/a/a/d$b;

    const p1, 0x7f0801fb

    .line 5
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld/a/b/f/b/l;->C:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)Ld/a/b/f/b/l;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/l;->C:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Ld/a/b/f/b/l;->C:Landroid/widget/TextView;

    if-nez p1, :cond_c

    const/16 p1, 0x8

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-object p0
.end method

.method public g(I)Ld/a/b/f/b/l;
    .registers 2

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/l;->a(Ljava/lang/CharSequence;)Ld/a/b/f/b/l;

    return-object p0
.end method
