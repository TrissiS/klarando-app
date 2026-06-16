.class public abstract Lc/c/a/i/a;
.super Ljava/lang/Object;
.source "CommonBarStyle.java"

# interfaces
.implements Lc/c/a/a;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public A(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const-string p1, ""

    return-object p1
.end method

.method public B(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public C(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public D(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 4

    .line 1
    invoke-virtual {p0, p1}, Lc/c/a/i/a;->N(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x10

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 4
    invoke-virtual {p1}, Landroid/widget/TextView;->setSingleLine()V

    .line 5
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/4 v1, -0x1

    .line 6
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 7
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setSelected(Z)V

    return-object p1
.end method

.method public I(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x1

    return p1
.end method

.method public J(Landroid/content/Context;)I
    .registers 2

    const p1, 0x800005

    return p1
.end method

.method public L(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public M(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public N(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public a(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public b(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/c/a/i/a;->L(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x10

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 4
    invoke-virtual {p1}, Landroid/widget/TextView;->setSingleLine()V

    .line 5
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    return-object p1
.end method

.method public c(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public d(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public e(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public f(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 5

    .line 1
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_33

    .line 2
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_33

    .line 4
    :try_start_11
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 6
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p1, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_30
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_11 .. :try_end_30} :catch_33

    if-nez p1, :cond_33

    return-object v0

    :catch_33
    :cond_33
    const-string p1, ""

    return-object p1
.end method

.method public g(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public h(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public i(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public j(Landroid/content/Context;)Z
    .registers 2

    const/4 p1, 0x1

    return p1
.end method

.method public l(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public m(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public o(Landroid/content/Context;)F
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    return p1
.end method

.method public p(Landroid/content/Context;)I
    .registers 2

    const p1, 0x800003

    return p1
.end method

.method public q(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public r(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/c/a/i/a;->M(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x10

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 4
    invoke-virtual {p1}, Landroid/widget/TextView;->setSingleLine()V

    .line 5
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    return-object p1
.end method

.method public s(Landroid/content/Context;)F
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    return p1
.end method

.method public t(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const-string p1, ""

    return-object p1
.end method

.method public u(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public v(Landroid/content/Context;)F
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    return p1
.end method

.method public w(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x41700000    # 15.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public y(Landroid/content/Context;)Landroid/view/View;
    .registers 3

    .line 1
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public z(Landroid/content/Context;)I
    .registers 2

    const p1, 0x800005

    return p1
.end method
