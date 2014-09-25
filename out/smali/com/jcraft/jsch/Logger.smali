.class public interface abstract Lcom/jcraft/jsch/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field public static final DEBUG:I = 0x0

.field public static final ERROR:I = 0x3

.field public static final FATAL:I = 0x4

.field public static final INFO:I = 0x1

.field public static final WARN:I = 0x2


# virtual methods
.method public abstract isEnabled(I)Z
.end method

.method public abstract log(ILjava/lang/String;)V
.end method
