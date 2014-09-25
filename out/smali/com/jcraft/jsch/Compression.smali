.class public interface abstract Lcom/jcraft/jsch/Compression;
.super Ljava/lang/Object;
.source "Compression.java"


# static fields
.field public static final DEFLATER:I = 0x1

.field public static final INFLATER:I


# virtual methods
.method public abstract compress([BI[I)[B
.end method

.method public abstract init(II)V
.end method

.method public abstract uncompress([BI[I)[B
.end method
