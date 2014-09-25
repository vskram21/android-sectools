.class public Lorg/apache/commons/io/output/NullWriter;
.super Ljava/io/Writer;
.source "NullWriter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 70
    return-void
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 65
    return-void
.end method

.method public write(I)V
    .locals 0
    .parameter "idx"

    .prologue
    .line 40
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 0
    .parameter "str"

    .prologue
    .line 55
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 0
    .parameter "str"
    .parameter "st"
    .parameter "end"

    .prologue
    .line 60
    return-void
.end method

.method public write([C)V
    .locals 0
    .parameter "chr"

    .prologue
    .line 45
    return-void
.end method

.method public write([CII)V
    .locals 0
    .parameter "chr"
    .parameter "st"
    .parameter "end"

    .prologue
    .line 50
    return-void
.end method
