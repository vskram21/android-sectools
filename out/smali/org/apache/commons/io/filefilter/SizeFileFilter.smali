.class public Lorg/apache/commons/io/filefilter/SizeFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "SizeFileFilter.java"


# instance fields
.field private acceptLarger:Z

.field private size:J


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .parameter "size"

    .prologue
    .line 55
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/filefilter/SizeFileFilter;-><init>(JZ)V

    .line 56
    return-void
.end method

.method public constructor <init>(JZ)V
    .locals 2
    .parameter "size"
    .parameter "acceptLarger"

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 68
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 69
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The size must be non-negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_0
    iput-wide p1, p0, Lorg/apache/commons/io/filefilter/SizeFileFilter;->size:J

    .line 72
    iput-boolean p3, p0, Lorg/apache/commons/io/filefilter/SizeFileFilter;->acceptLarger:Z

    .line 73
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 7
    .parameter "file"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 88
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v3

    iget-wide v5, p0, Lorg/apache/commons/io/filefilter/SizeFileFilter;->size:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    move v0, v1

    .line 89
    .local v0, smaller:Z
    :goto_0
    iget-boolean v3, p0, Lorg/apache/commons/io/filefilter/SizeFileFilter;->acceptLarger:Z

    if-eqz v3, :cond_2

    if-nez v0, :cond_1

    :goto_1
    return v1

    .end local v0           #smaller:Z
    :cond_0
    move v0, v2

    .line 88
    goto :goto_0

    .restart local v0       #smaller:Z
    :cond_1
    move v1, v2

    .line 89
    goto :goto_1

    :cond_2
    move v1, v0

    goto :goto_1
.end method
