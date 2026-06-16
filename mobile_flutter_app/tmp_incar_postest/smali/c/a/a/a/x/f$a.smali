.class public Lc/a/a/a/x/f$a;
.super Ljava/lang/Object;
.source "MaterialCalendar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/f;->c(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:I

.field public final synthetic i:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;I)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$a;->i:Lc/a/a/a/x/f;

    iput p2, p0, Lc/a/a/a/x/f$a;->h:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f$a;->i:Lc/a/a/a/x/f;

    invoke-static {v0}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget v1, p0, Lc/a/a/a/x/f$a;->h:I

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->h(I)V

    return-void
.end method
