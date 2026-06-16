.class public final Ld/a/b/f/b/j$a;
.super Ld/a/a/c$e;
.source "SelectDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/b/f/b/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/a/c<",
        "Ld/a/a/c<",
        "*>.e;>.e;"
    }
.end annotation


# instance fields
.field public final B:Landroid/widget/TextView;

.field public final C:Landroid/widget/CheckBox;

.field public final synthetic D:Ld/a/b/f/b/j;


# direct methods
.method public constructor <init>(Ld/a/b/f/b/j;)V
    .registers 3

    .line 1
    iput-object p1, p0, Ld/a/b/f/b/j$a;->D:Ld/a/b/f/b/j;

    const v0, 0x7f0b003b

    .line 2
    invoke-direct {p0, p1, v0}, Ld/a/a/c$e;-><init>(Ld/a/a/c;I)V

    const p1, 0x7f0801f7

    .line 3
    invoke-virtual {p0, p1}, Ld/a/a/c$e;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld/a/b/f/b/j$a;->B:Landroid/widget/TextView;

    const p1, 0x7f0801f6

    .line 4
    invoke-virtual {p0, p1}, Ld/a/a/c$e;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iput-object p1, p0, Ld/a/b/f/b/j$a;->C:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public c(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/j$a;->B:Landroid/widget/TextView;

    iget-object v1, p0, Ld/a/b/f/b/j$a;->D:Ld/a/b/f/b/j;

    invoke-virtual {v1, p1}, Ld/a/b/d/b;->e(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Ld/a/b/f/b/j$a;->C:Landroid/widget/CheckBox;

    iget-object v1, p0, Ld/a/b/f/b/j$a;->D:Ld/a/b/f/b/j;

    invoke-static {v1}, Ld/a/b/f/b/j;->d(Ld/a/b/f/b/j;)Ljava/util/HashMap;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3
    iget-object p1, p0, Ld/a/b/f/b/j$a;->D:Ld/a/b/f/b/j;

    invoke-static {p1}, Ld/a/b/f/b/j;->e(Ld/a/b/f/b/j;)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_32

    .line 4
    iget-object p1, p0, Ld/a/b/f/b/j$a;->C:Landroid/widget/CheckBox;

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setClickable(Z)V

    goto :goto_37

    .line 5
    :cond_32
    iget-object p1, p0, Ld/a/b/f/b/j$a;->C:Landroid/widget/CheckBox;

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    :goto_37
    return-void
.end method
