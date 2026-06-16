.class public abstract Lc/a/a/a/x/m;
.super Landroidx/fragment/app/Fragment;
.source "PickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/fragment/app/Fragment;"
    }
.end annotation


# instance fields
.field public final f0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lc/a/a/a/x/l<",
            "TS;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/x/l;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/a/a/a/x/l<",
            "TS;>;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public x0()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->clear()V

    return-void
.end method
