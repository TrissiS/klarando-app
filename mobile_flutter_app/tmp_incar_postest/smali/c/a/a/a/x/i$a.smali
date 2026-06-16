.class public Lc/a/a/a/x/i$a;
.super Lc/a/a/a/x/l;
.source "MaterialTextInputPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/i;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/x/l<",
        "TS;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/x/i;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/i;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/i$a;->a:Lc/a/a/a/x/i;

    invoke-direct {p0}, Lc/a/a/a/x/l;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/x/i$a;->a:Lc/a/a/a/x/i;

    iget-object v0, v0, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/x/l;

    .line 4
    invoke-virtual {v1}, Lc/a/a/a/x/l;->a()V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/i$a;->a:Lc/a/a/a/x/i;

    iget-object v0, v0, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/x/l;

    .line 2
    invoke-virtual {v1, p1}, Lc/a/a/a/x/l;->a(Ljava/lang/Object;)V

    goto :goto_8

    :cond_18
    return-void
.end method
