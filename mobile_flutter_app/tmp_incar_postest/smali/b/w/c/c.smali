.class public final Lb/w/c/c;
.super Ljava/lang/Object;
.source "FakeDrag.java"


# instance fields
.field public final a:Lb/w/c/e;


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Lb/w/c/e;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lb/w/c/c;->a:Lb/w/c/e;

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/w/c/c;->a:Lb/w/c/e;

    invoke-virtual {v0}, Lb/w/c/e;->d()Z

    move-result v0

    return v0
.end method
