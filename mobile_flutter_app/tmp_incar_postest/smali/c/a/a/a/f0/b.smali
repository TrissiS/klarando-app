.class public final Lc/a/a/a/f0/b;
.super Lb/b/p/j/g;
.source "NavigationBarMenu.java"


# instance fields
.field public final B:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final C:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Class;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "*>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lb/b/p/j/g;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p2, p0, Lc/a/a/a/f0/b;->B:Ljava/lang/Class;

    .line 3
    iput p3, p0, Lc/a/a/a/f0/b;->C:I

    return-void
.end method


# virtual methods
.method public a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 8

    .line 1
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget v2, p0, Lc/a/a/a/f0/b;->C:I

    if-gt v0, v2, :cond_1f

    .line 2
    invoke-virtual {p0}, Lb/b/p/j/g;->s()V

    .line 3
    invoke-super {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    .line 4
    instance-of p2, p1, Lb/b/p/j/i;

    if-eqz p2, :cond_1b

    .line 5
    move-object p2, p1

    check-cast p2, Lb/b/p/j/i;

    invoke-virtual {p2, v1}, Lb/b/p/j/i;->c(Z)V

    .line 6
    :cond_1b
    invoke-virtual {p0}, Lb/b/p/j/g;->r()V

    return-object p1

    .line 7
    :cond_1f
    iget-object p1, p0, Lc/a/a/a/f0/b;->B:Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    .line 8
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Maximum number of items supported by "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " is "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p0, Lc/a/a/a/f0/b;->C:I

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ". Limit can be checked with "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "#getMaxItemCount()"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 5

    .line 1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lc/a/a/a/f0/b;->B:Ljava/lang/Class;

    .line 2
    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " does not support submenus"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
