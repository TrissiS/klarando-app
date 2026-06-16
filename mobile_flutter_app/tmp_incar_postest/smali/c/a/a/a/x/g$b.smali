.class public Lc/a/a/a/x/g$b;
.super Ljava/lang/Object;
.source "MaterialDatePicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/g;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/x/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/g$b;->h:Lc/a/a/a/x/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g$b;->h:Lc/a/a/a/x/g;

    invoke-static {v0}, Lc/a/a/a/x/g;->b(Lc/a/a/a/x/g;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View$OnClickListener;

    .line 2
    invoke-interface {v1, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_a

    .line 3
    :cond_1a
    iget-object p1, p0, Lc/a/a/a/x/g$b;->h:Lc/a/a/a/x/g;

    invoke-virtual {p1}, Lb/l/d/c;->x0()V

    return-void
.end method
